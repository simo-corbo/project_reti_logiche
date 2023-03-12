-- DeSerT riceve in input clock, start e dati
-- output è il canale di uscita, l'indirizzo e la validità dei dati 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.std_logic_arith.all;
--use IEEE.std_logic_signed.all;


entity DeSerializeTransform is
port(
        reset: in std_logic;                        --reset signal from input
        start: in std_logic;                        --start sequence channel(1), channel(0), (data)
        i_clk: in std_logic;                        --clock signal
        input: in std_logic;                        --input data
        valid: out std_logic;                       --valid output
        data: out std_logic_vector(15 downto 0);    --output address
        channel: out std_logic_vector(1 downto 0)   --output channel
        );
end DeSerializeTransform;



architecture DST_arch of DeSerializeTransform is
    --FSM   -----------|-----------|--------------------|-------------------------------------------------------------------------------------------------------|
    --      |    ##    |    mode   |   State on FSM     |   notes                                                                                               |
    --      -----------|-----------|--------------------|-------------------------------------------------------------------------------------------------------|
    --      |    00    | WAIT_DATA |   WaitData         |   waits until start 0->1 and in that occasion, puts the first bit received in output                  |
    --      |    01    | GET_CH0   |   Get Channel 0    |   puts the second bit received in output                                                              |
    --      |    10    | GET_ADD   |   Get Address      |   starts from address 0...0 and keeps shifting from right to left the bit in input while start is 1   |
    --      ----------------------------------------------------------------------------------------------------------------------------------------------------|
    
    type STATES is (WAIT_DATA, GET_CH0, GET_ADD);                               --States definition
    signal mode   : STATES :=WAIT_DATA;                                         --current FSM State
    signal internal_ch1: std_logic :='0';                                       --link between input and channel(1)
    signal internal_ch0: std_logic := '0';                                      --link between input and channel(0)
    signal internal_out_data: std_logic_vector(15 downto 0) := (others=>'0');   --shifter register
begin

    mode_change: process(i_clk)                                                 --lambda and delta function
    begin
        if(i_clk'event and i_clk='1') then                                      --DeSerT synchronized on clock's raising edge
            if(reset='0') then                                                  --DeSerT works only if it's not in reset mode
                case mode is
                    when WAIT_DATA =>                                           --WAIT_DATA state
                        if(start='1') then                                          --If start=1 then the bit read on the input is the MSB of channel
                            valid<='0';         
                            internal_ch1<=input;
                            internal_out_data<=(others=>'0');                       --internal reset of shift register
                            mode<=GET_CH0;                                          --transition in order to read the LSB of the output channel
                        end if;
                    when GET_CH0 =>                                             --GET_CH0 state
                        internal_ch0<=input;                                        --read from input LSB of channel
                        mode<=GET_ADD;                                              --transition to read the address
                        
                    when GET_ADD =>                                             --GET_ADD state
                        if start='1' then                                           --checks if GET_ADD is still necessary (input length can be arbitrary between 2 and 18)
                            internal_out_data(15 downto 1) <= internal_out_data(14 downto 0); --shift register
                            internal_out_data(0)<=input;    
                            valid<='0';                                             --keeps the valid flag to 0, waiting for start to descend
                        else                                    
                            valid<='1';                                             --puts 1 in valid, because start=0, so the reading has finished
                            mode<=WAIT_DATA;                                        --returns in waiting mode
                        end if;
                end case;
             elsif(reset='1') then                                              --Reset signal is on
                mode<=WAIT_DATA;                                                --mode changed to WAIT_DATA
                valid<='0';                                                     --Internal reset
                internal_ch0<='0';
                internal_ch1<='0';
                internal_out_data<=(others=>'0');
             end if;
           end if;
    end process;
    
    channel(0)<=internal_ch0;               --internal wiring
    channel(1)<=internal_ch1;               --internal wiring
    data<=internal_out_data;                --internal wiring
    
end DST_arch;