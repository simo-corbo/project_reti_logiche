
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.std_logic_arith.all;
--use IEEE.std_logic_signed.all;


entity DeSerializeTransform is
port(
        reset: in std_logic;                        		--reset signal from input
        start: in std_logic;                       			--start sequence channel(1), channel(0), (data)
        i_clk: in std_logic;                        		--clock signal
        input: in std_logic;                        		--input data
        data:  in std_logic_vector(7 downto 0);				--data from memory
        valid_input: out std_logic;                       	--valid_input output
        valid_data: out std_logic;							--valid_data in output
        read_memory: out std_logic;							--memory enable
        address: out std_logic_vector(15 downto 0);    		--output memory address
        channel: out std_logic_vector(1 downto 0);   		--output channel

        out_0: out std_logic_vector(7 downto 0);			--channel 0
        out_1: out std_logic_vector(7 downto 0);			--channel 1
        out_2: out std_logic_vector(7 downto 0);			--channel 2
        out_3: out std_logic_vector(7 downto 0)				--channel 3
                
        );
end DeSerializeTransform;



architecture DST_arch of DeSerializeTransform is
    --FSM   -----------|-----------|--------------------|-------------------------------------------------------------------------------------------------------|
    --      |    ##    |    mode   |   State on FSM     |   notes                                                                                               |
    --      -----------|-----------|--------------------|-------------------------------------------------------------------------------------------------------|
    --      |    00    | WAIT_ADD  |   Waitaddress      |   waits until start 0->1 and in that occasion, puts the first bit received in address                 |
    --      |    01    | GET_CH0   |   Get Channel 0    |   puts the second bit received in address                                                             |
    --      |    10    | GET_ADD   |   Get Address      |   starts from address 0...0 and keeps shifting from right to left the bit in input while start is 1   |
    --      |    11    | SEND_ADD  |   Send Address     |   as start 1->0, the memory is enabled, reading from the address vector                               |
    --      |   100    | SAVE      |   Receive address  |   the data from memory is received and put in the correct channel                                     |
    --      |   101    | SHOW      |   Show data        |   show the data stored inside the 4 channels                                                          |	
    --      ----------------------------------------------------------------------------------------------------------------------------------------------------|
    
    type STATES is (WAIT_ADD, GET_CH0, GET_ADD, SEND_ADD, SAVE, SHOW, RST);                               --States definition
    signal mode   : STATES :=WAIT_ADD;                                         --current FSM State
    signal internal_channel: std_logic_vector(1 downto 0);  --link between input and channel(0)
    signal internal_out_address: std_logic_vector(15 downto 0) := (others=>'0');   --shifter register

begin

    mode_change: process(i_clk)                                                 --lambda and delta function
    begin
        if(i_clk'event and i_clk='1') then                                      --DeSerT synchronized on clock's raising edge
            if(reset='1') then
                mode<=RST;
            end if;
            case mode is
                when WAIT_ADD =>                                           --WAIT_ADD state
                    read_memory<='0'; 
                    valid_data<='0';  
                    if(start='1') then                                          --If start=1 then the bit read on the input is the MSB of channel      
                        valid_input<='0';
                        internal_channel(1)<=input;
                        internal_out_address<=(others=>'0');                       --internal reset of shift register
                        mode<=GET_CH0;                                          --transition in order to read the LSB of the output channel
                    end if;
                when GET_CH0 =>  
                    valid_input<='0'; 
                    valid_data<='0';                                             --GET_CH0 state
                    internal_channel(0)<=input;                                  --read from input LSB of channel
                    mode<=GET_ADD;                                              --transition to read the address
                    
                when GET_ADD => 
                    valid_data<='0';                                              --keeps the valid flag to 0, waiting for start to descend
                    if start='1' then                                           --checks if GET_ADD is still necessary (input length can be arbitrary between 2 and 18)
                        internal_out_address(15 downto 1) <= internal_out_address(14 downto 0); --shift register
                        internal_out_address(0)<=input;    
                        valid_input<='0';
                    else                                    
                        valid_input<='1';  
                        mode<=SAVE; 
                        read_memory<='1';                                     
                    end if;
                when SEND_ADD =>
                        valid_data<='0';
                        mode<=SHOW;
                when SAVE =>
                        read_memory<='0';
                        case internal_channel is
                            when "00" => out_0<=data;
                            when "01" => out_1<=data;
                            when "10" => out_2<=data;
                            when "11" => out_3<=data;
                            when others => valid_data<='0';                             
                        end case;
                        valid_data<='1'; 
                        mode<=SHOW;
                        
                when SHOW =>
                        read_memory<='0';
                        
                        --secondo componente
                        
                        valid_data<='1'; 
                        mode<=WAIT_ADD;
                        
                        
                when RST =>
                    valid_input<='0';
                    internal_channel<=(others=>'0');                                                 --Internal reset
                    internal_out_address<=(others=>'0');
                    out_0<=(others => '0');
                    out_1<=(others => '0');
                    out_2<=(others => '0');
                    out_3<=(others => '0');
                    mode<=WAIT_ADD;                                                				     --mode changed to WAIT_ADD

                end case;
          end if;  
    end process;
    address<=internal_out_address;                												 --internal wiring
    channel<=internal_channel;    
end DST_arch;