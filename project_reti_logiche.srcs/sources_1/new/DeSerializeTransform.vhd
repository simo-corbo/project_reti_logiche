
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
    
    type STATES is (WAIT_INPUT, GET_CH1, GET_CH0, GET_ADD, SEND_INPUT, RST);                  --States definition
    signal mode   : STATES :=RST;                                        --current FSM State
    signal internal_channel: std_logic_vector(1 downto 0) :=(others=>'0');      --link between input and channel(0)
    signal internal_out_address: std_logic_vector(15 downto 0) := (others=>'0');--shifter register
--    signal internal_input: std_logic:='0';

begin

    mode_funct: process(mode)
    begin
    valid_input<='0';
        case mode is 
            when WAIT_INPUT =>
                    valid_input<='0';                                           --input is not valid yet
            when GET_CH1=>
                    valid_input<='0';
            when GET_CH0 =>
                    valid_input<='0';                                               --redundant setting of valid_input
            when GET_ADD =>
                    if start='1' then                                               --checks if GET_ADD is still necessary (input length can be arbitrary between 2 and 18)
                        valid_input<='0';                                               --redundant setting of valid_input
                    else                                    
                        valid_input<='1';                                            --end of input reading
                    end if;
            when SEND_INPUT =>
                        valid_input<='1';
            when RST => 
                    valid_input<='0';                                               --input not valid during reset
            when others =>
                    valid_input<='0';
         end case;
     end process;


    mode_change: process(i_clk)                                                 --lambda and delta function
    begin
        if(i_clk'event and i_clk='1') then                                      --DeSerT synchronized on clock's raising edge
            if(reset='1') then                                                  --Reset trigger
                    internal_out_address<=(others=>'0');   
                    internal_channel<=(others=>'0');
                    mode<=RST;                                               --when in reset returns to WAIT_INPUT state
            else
            case mode is
                when RST =>
                    internal_out_address<=(others=>'0');
                    internal_channel<=(others=>'0');
                    if(start='0') then
                        mode<=WAIT_INPUT;
                    else
                        internal_channel(1)<=input;
                        internal_channel(0)<=internal_channel(0);
                        mode<=GET_CH1;
                    end if;
                when WAIT_INPUT =>                                              --WAIT_INPUT state
                    internal_out_address<=(others=>'0');
                    if(start='1') then                                              --start check  
                        internal_channel(1)<=input;
                        internal_channel(0)<=internal_channel(0);
                        mode<=GET_CH1;                                              --transition in order to read the LSB of the output channel
                    else
                        internal_channel<=internal_channel;
                        mode<=WAIT_INPUT;
                    end if;
                when GET_CH1 =>
                        internal_channel(0)<=input;
                        internal_channel(1)<=internal_channel(1);
                        internal_out_address<=(others=>'0');
                    mode<=GET_CH0;         
                when GET_CH0 =>                                                 --GET_CH0 saves the LSB of Channel  
                    internal_channel<=internal_channel;                                                  
                    internal_out_address<=(others=>'0');
                    if(start='1') then
                        internal_out_address(0)<=input;
                    end if;--transition to read the address
                    mode<=GET_ADD;
                when GET_ADD =>                                                 --GET_ADD implements the shift register 
                    internal_channel<=internal_channel;
                    if start='0' then
                        internal_out_address<=internal_out_address;
                        mode<=SEND_INPUT;                                            --keeps the SEND_INPUT on for 2 clock cycles 
                    else
                       internal_out_address(15 downto 1) <= internal_out_address(14 downto 0); --shift register
                       internal_out_address(0)<=input;
                       mode<=GET_ADD;                           
                    end if;
                when SEND_INPUT =>
                        internal_channel<=internal_channel;
                        internal_out_address<=internal_out_address;
                        mode<=WAIT_INPUT;
                when others =>
                        internal_channel<=internal_channel;
                        internal_out_address<=internal_out_address;
                        mode<=WAIT_INPUT;
                end case;
          end if;  
          end if;
--          internal_input<=input;
    end process;
    address<=internal_out_address;                												 --internal wiring
    channel<=internal_channel;    
end DST_arch;