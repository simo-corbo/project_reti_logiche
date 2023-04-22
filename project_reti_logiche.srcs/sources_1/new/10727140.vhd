--Progetto Finale di Reti Logiche
--A.A. 2022/23
--Progetto di Simone Corbo
--Codice Persona 10727140
--Matricola 955854
--III Consegna 15 maggio 2023

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;


entity project_reti_logiche is
    port(
        i_clk   : in std_logic;
        i_rst   : in std_logic;
        i_start : in std_logic;
        i_w     : in std_logic;

        o_z0   : out std_logic_vector(7 downto 0);
        o_z1   : out std_logic_vector(7 downto 0);
        o_z2   : out std_logic_vector(7 downto 0);
        o_z3   : out std_logic_vector(7 downto 0);
        o_done : out std_logic;
        
        o_mem_addr : out std_logic_vector(15 downto 0);
        i_mem_data : in std_logic_vector(7 downto 0);
        o_mem_we   : out std_logic; --write enable
        o_mem_en   : out std_logic --enable
    );
end project_reti_logiche;

architecture project_reti_logiche_arch of project_reti_logiche is
   --Signals
   signal valid_input: std_logic:='0';
   signal valid_data: std_logic:='0';
   signal address: std_logic_vector(15 downto 0):=(others=>'0');
   signal channel: std_logic_vector(1 downto 0):=(others=>'0');
   signal data_out: std_logic_vector(7 downto 0):=(others=>'0');   
   signal done: std_logic:='0';
   signal out_z0:std_logic_vector(7 downto 0):=(others=>'0');
   signal out_z1:std_logic_vector(7 downto 0):=(others=>'0');
   signal out_z2:std_logic_vector(7 downto 0):=(others=>'0');
   signal out_z3:std_logic_vector(7 downto 0):=(others=>'0');
   
   
   --Components
   component DeSerializeTransform is port(
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
    end component;
    
    begin
        DeSerT : DeSerializeTransform port map(
                 reset => i_rst, 
                 start => i_start,
                 i_clk => i_clk,
                 
                 input => i_w,
                 
                 data =>i_mem_data,
                 
                 valid_input=>valid_input,
                 valid_data => valid_data,
                 
                 read_memory=>o_mem_en,
                 address=>o_mem_addr, 

                 channel=>channel,
                 
                 out_0=>o_z0,
                 out_1=>o_z1,
                 out_2=>o_z2,
                 out_3=>o_z3
                 );
                 
    valid_input_trigger: process(valid_input) --is triggered when received a valid input
    begin
--    if(i_clk'event and i_clk='1') then
        if(valid_input'event and valid_input='1') then
            o_done<='0';
            o_done<='1' after 2 ns;
       -- elsif (valid_input'event and valid_input='0') then
       --     o_done<='0';
        end if;   
--    end if; 
    end process;
    
    --o_mem_addr<=address;
    --o_mem_en<=valid_input;
    --o_mem_we<='0';  
    --o_z0<=out_z0;
    --o_z1<=out_z1;
    --o_z2<=out_z2;
    --o_z3<=out_z3;
            
end project_reti_logiche_arch;
