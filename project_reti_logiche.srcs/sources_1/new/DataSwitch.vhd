
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DataSwitch is
port(
        reset: in std_logic;                        		--reset signal from input
        i_clk: in std_logic;                        		--clock signal from input
        
        valid_input: in std_logic;                       	--valid input from DeSerT
        input_channel: in std_logic_vector(1 downto 0);  	--channel selector from DeSerT
--        input_address: in std_logic_vector(15 downto 0);    --memory address from DeSerT
        
        data: in std_logic_vector(7 downto 0);              --data from memory        
        
        o_z0: out std_logic_vector(7 downto 0);             --channel 0
        o_z1: out std_logic_vector(7 downto 0);             --channel 1
        o_z2: out std_logic_vector(7 downto 0);             --channel 2
        o_z3: out std_logic_vector(7 downto 0);             --channel 3
        done: out std_logic                                --end of elaboration
        
--        memory_enable: out std_logic
--        memory_address: out std_logic_vector(15 downto 0)
        );
end DataSwitch;



architecture DS_arch of DataSwitch is
    --FSM   -----------|------------|--------------------|-------------------------------------------------------------------------------------------------------|
    --      |    ##    |    mode    |   State on FSM     |   notes                                                                                               |
    --      -----------|------------|--------------------|-------------------------------------------------------------------------------------------------------|
    --      |    00    | WAIT_INPUT |   Waitaddress      |   waits until start 0->1 and in that occasion, puts the first bit received in address                 |
    --      |    01    | GET_CH0    |   Get Channel 0    |   puts the second bit received in address                                                             |
    --      |    10    | GET_ADD    |   Get Address      |   starts from address 0...0 and keeps shifting from right to left the bit in input while start is 1   |
    --      |    11    | SEND_INPUT |   Send Address     |   as start 1->0, the memory is enabled, reading from the address vector                               |                                                        |	
    --      -----------------------------------------------------------------------------------------------------------------------------------------------------|
    
    type STATES is (WAIT_INPUT, WAIT_DATA, SAVE, SHOW, RST);                     --States definition
    signal mode   : STATES :=RST;                                           --current FSM State

--    signal internal_address: std_logic_vector(15 downto 0) := (others=>'0');--shifter register
    signal internal_z0: std_logic_vector(7 downto 0):=(others=>'0');        --internal channel 0
    signal internal_z1: std_logic_vector(7 downto 0):=(others=>'0');        --internal channel 1
    signal internal_z2: std_logic_vector(7 downto 0):=(others=>'0');        --internal channel 2
    signal internal_z3: std_logic_vector(7 downto 0):=(others=>'0');        --internal channel 3

begin

 mode_change: process(i_clk)                                                 --lambda and delta function
    begin
        if(i_clk'event and i_clk='1') then                                      --DeSerT synchronized on clock's raising edge
            if(reset='1') then                                                  --Reset trigger
                    mode<=RST;                                               --when in reset returns to WAIT_INPUT state
            else
            case mode is
                when RST =>
                    mode<=WAIT_INPUT;
                when WAIT_INPUT =>                                              --WAIT_INPUT state
                    if(valid_input='1') then                                        --reads from memory only when valid_input is 1
                        mode<=WAIT_DATA;
                    else
                        mode<=WAIT_INPUT;
                    end if;
                when WAIT_DATA =>
                    --ASSUMPTION
                    --the waiting time for the memory to return the correct data is 2 ns
                    --a clock cycle is at least 20 ns, so waiting for one clock cycle should be enough
                    mode<=SAVE;
                when SAVE =>
                    mode<=SHOW;
                when SHOW =>
                    mode<=WAIT_INPUT;
                when others =>
                    mode<=WAIT_INPUT;
                end case;
          end if; 
          end if; 
    end process;


    mode_func: process(mode)
    begin
        case mode is
            when RST =>
                    internal_z0<=(others=>'0');                                     --internal signal reset
                    internal_z1<=(others=>'0');
                    internal_z2<=(others=>'0');
                    internal_z3<=(others=>'0');
                    done<='0';
                    o_z0<=(others=>'0');
                    o_z1<=(others=>'0');
                    o_z2<=(others=>'0');
                    o_z3<=(others=>'0');
            when WAIT_INPUT =>
                    done<='0';
                    o_z0<=(others=>'0');
                    o_z1<=(others=>'0');
                    o_z2<=(others=>'0');
                    o_z3<=(others=>'0');
            when WAIT_DATA =>
            when SAVE =>
                    case input_channel is
                        when "00" =>
                            internal_z0<=data;                        
                        when "01" =>
                            internal_z1<=data;
                        when "10" =>
                            internal_z2<=data;
                        when "11" =>
                            internal_z3<=data;
                        when others =>
                            internal_z0<=data;
                    end case;
             when SHOW =>
                    o_z0<=internal_z0;
                    o_z1<=internal_z1;
                    o_z2<=internal_z2;
                    o_z3<=internal_z3;
                    done<='1';
             end case;
    end process;
end DS_arch;