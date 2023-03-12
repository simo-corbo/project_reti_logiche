-- DeSerT riceve in input clock, start e dati
-- output è il canale di uscita, l'indirizzo e la validità dei dati 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;


entity DeSerializeTransform is
port(
        reset: in std_logic;--reset signal from input
        start: in std_logic; --start sequence channel(1), channel(0), data
        i_clk: in std_logic; --clock signal
        input: in std_logic; --input data
        valid: out std_logic; --valid output
        data: out std_logic_vector(15 downto 0); --output address
        channel: out std_logic_vector(1 downto 0) --output channel
        );
end DeSerializeTransform;



architecture DST_arch of DeSerializeTransform is

    type STATES is (WAIT_DATA, GET_CH1, GET_CH0, GET_ADD);
    signal mode   : STATES :=WAIT_DATA;
    --Mode
    --      |   mode   |     Q     |   State on FSM     |   notes
    --      --------------------------------------------|---------------
    --      |    00    |     R     |   WaitData         |   waits until s_start 0->1
    --      |    01    |    GC0    |   Get Channel 1    |   puts the first bit received in output
    --      |    10    |    GC1    |   Get Channel 0    |   puts the second bit received in output
    --      |    11    |    GA     |   Get Address      |   starts from address 0...0 and keeps shifting from right to left the bit in input while start is 1
    signal s_start:   std_logic :='0';                                          --clocked start 
    signal internal_ch1: std_logic :='0';                                       --link between input and channel(1)
    signal internal_ch0: std_logic := '0';                                      --link between input and channel(0)
    signal internal_out_data: std_logic_vector(15 downto 0) := (others=>'0');   --shifter register
begin
--    mode_mux: process(i_clk, mode) --delta
--        begin
--        if(i_clk'event and i_clk='1') then
--            --if(mode'event or mode=GET_ADD) then
--                case mode is
--                    when WAIT_DATA =>
--                    when GET_CH1 =>
--                        internal_ch1<=input;
--                        internal_out_data<=(others=>'0');
--                    when GET_CH0 =>
--                        internal_ch0<=input;
--                    when GET_ADD =>
--                        internal_out_data(15 downto 1) <= internal_out_data(14 downto 0);
--                        internal_out_data(0)<=input;
--                end case;
--             end if;
--         --end if;
--    end process;

    mode_change: process(i_clk) --lambda
    begin
        if(i_clk'event and i_clk='1') then
            if(reset='0') then
                case mode is
                    when WAIT_DATA =>
                        --valid<='0';
                        if(start='1') then
                            valid<='0';
                            internal_ch1<=input;
                            internal_out_data<=(others=>'0');
                            mode<=GET_CH0;
                        end if;
                    when GET_CH1 =>
                        valid<='0';
                        internal_ch1<=input;
                        internal_out_data<=(others=>'0');
                        mode<=GET_CH0;
                    when GET_CH0 =>
                        internal_ch0<=input;
                        mode<=GET_ADD;
--                        if (start='1') then
--                            valid<='0';
--                            mode<=GET_ADD;
--                        else
--                            valid<='1';
--                            mode<=WAIT_DATA;
--                        end if;
                    when GET_ADD =>
                        if start='1' then
                            internal_out_data(15 downto 1) <= internal_out_data(14 downto 0);
                            internal_out_data(0)<=input;    
                            mode<=GET_ADD;
                            valid<='0';
                        else
                            valid<='1';
                            mode<=WAIT_DATA;
                        end if;
                end case;
             elsif(reset='1') then
                mode<=WAIT_DATA;
                valid<='0';
                internal_ch0<='0';
                internal_ch1<='0';
                internal_out_data<=(others=>'0');
             end if;
           end if;
                 end process;
    
    channel(0)<=internal_ch0;
    channel(1)<=internal_ch1;
    data<=internal_out_data;
    
end DST_arch;