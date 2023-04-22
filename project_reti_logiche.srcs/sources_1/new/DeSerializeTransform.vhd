
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DeSerializeTransform is
port(
        reset: in std_logic;                        		--reset signal from input
        start: in std_logic;                       			--start sequence channel(1), channel(0), (data)
        i_clk: in std_logic;                        		--clock signal
        input: in std_logic;                        		--input data
        
        valid_input: out std_logic;                       	--valid_input output
        address: out std_logic_vector(15 downto 0);    		--output memory address
        channel: out std_logic_vector(1 downto 0)   		--output channel
        );
end DeSerializeTransform;



architecture DST_arch of DeSerializeTransform is
    --FSM   -----------|-----------|--------------------|-------------------------------------------------------------------------------------------------------|
    --      |    ##    |    mode   |   State on FSM     |   notes                                                                                               |
    --      -----------|-----------|--------------------|-------------------------------------------------------------------------------------------------------|
    --      |    00    | WAIT_INPUT|   Waitaddress      |   waits until start 0->1 and in that occasion, puts the first bit received in address                 |
    --      |    01    | GET_CH0   |   Get Channel 0    |   puts the second bit received in address                                                             |
    --      |    10    | GET_ADD   |   Get Address      |   starts from address 0...0 and keeps shifting from right to left the bit in input while start is 1   |
    --      |    11    | SEND_INPUT|   Send Address     |   as start 1->0, the memory is enabled, reading from the address vector                               |                                                        |	
    --      ----------------------------------------------------------------------------------------------------------------------------------------------------|
    
    type STATES is (WAIT_INPUT, GET_CH0, GET_ADD, SEND_INPUT);                  --States definition
    signal mode   : STATES :=WAIT_INPUT;                                        --current FSM State
    signal internal_channel: std_logic_vector(1 downto 0) :=(others=>'0');      --link between input and channel(0)
    signal internal_out_address: std_logic_vector(15 downto 0) := (others=>'0');--shifter register

begin

    mode_change: process(i_clk)                                                 --lambda and delta function
    begin
        if(i_clk'event and i_clk='1') then                                      --DeSerT synchronized on clock's raising edge
            if(reset='1') then                                                  --Reset trigger
                    mode<=WAIT_INPUT;                                               --when in reset returns to WAIT_INPUT state
                    valid_input<='0';                                               --input not valid during reset
                    internal_channel<=(others=>'0');                                --Internal reset
                    internal_out_address<=(others=>'0');
            end if;
            case mode is
                when WAIT_INPUT =>                                              --WAIT_INPUT state
                    valid_input<='0';                                           --input is not valid yet
                    if(start='1') then                                              --start check  
                        internal_channel(1)<=input;                                 --the first bit read from input is the MSB of channel
                        internal_out_address<=(others=>'0');                        --internal reset of shift register
                        mode<=GET_CH0;                                              --transition in order to read the LSB of the output channel
                    end if;
                when GET_CH0 =>                                                 --GET_CH0 saves the LSB of Channel  
                    valid_input<='0';                                               --redundant setting of valid_input
                    internal_channel(0)<=input;                                     --read from input LSB of channel
                    mode<=GET_ADD;                                                  --transition to read the address
                    
                when GET_ADD =>                                                 --GET_ADD implements the shift register 
                    if start='1' then                                               --checks if GET_ADD is still necessary (input length can be arbitrary between 2 and 18)
                        valid_input<='0';                                               --redundant setting of valid_input
                        internal_out_address(15 downto 1) <= internal_out_address(14 downto 0); --shift register
                        internal_out_address(0)<=input;
                    else                                    
                        valid_input<='1';                                            --end of input reading
                        mode<=SEND_INPUT;                                            --keeps the SEND_INPUT on for 2 clock cycles                                   
                    end if;
                when SEND_INPUT =>
                        mode<=WAIT_INPUT;
                end case;
          end if;  
    end process;
    address<=internal_out_address;                												 --internal wiring
    channel<=internal_channel;    
end DST_arch;