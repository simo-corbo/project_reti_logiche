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
      
   --Components
   component DeSerializeTransform is port(
        reset: in std_logic;                        		--reset signal from input
        start: in std_logic;                       			--start sequence channel(1), channel(0), (data)
        i_clk: in std_logic;                        		--clock signal
        input: in std_logic;                        		--input data
        
        valid_input: out std_logic;                       	--valid_input output
        address: out std_logic_vector(15 downto 0);    		--output memory address
        channel: out std_logic_vector(1 downto 0)   		--output channel
        );
    end component;
    
    component DataSwitch is port(
        reset: in std_logic;                        		--reset signal from input
        i_clk: in std_logic;                        		--clock signal from input
        
        valid_input: in std_logic;                       	--valid input from DeSerT
        input_channel: in std_logic_vector(1 downto 0);  		    --channel selector from DeSerT
        input_address: in std_logic_vector(15 downto 0);    		--memory address from DeSerT
        
        data: in std_logic_vector(7 downto 0);              --data from memory        
        
        o_z0: out std_logic_vector(7 downto 0);             --channel 0
        o_z1: out std_logic_vector(7 downto 0);             --channel 1
        o_z2: out std_logic_vector(7 downto 0);             --channel 2
        o_z3: out std_logic_vector(7 downto 0);             --channel 3
        done: out std_logic;                                --end of elaboration
        
        memory_enable: out std_logic;
        memory_address: out std_logic_vector(15 downto 0)
        );
    end component;
    
    begin
        DeSerT : DeSerializeTransform port map(
                    reset => i_rst, 
                    start => i_start,
                    i_clk => i_clk,
                    input => i_w,
                                  
                    valid_input=>valid_input,
                    address=>address, 
                    channel=>channel
                 );
        DS     : DataSwitch port map(
                    reset => i_rst,
                    i_clk =>i_clk,
                    
                    valid_input => valid_input,
                    input_channel =>channel,
                    input_address => address,
                    
                    data =>i_mem_data,
                    
                    o_z0 => o_z0,
                    o_z1 => o_z1,
                    o_z2 => o_z2,
                    o_z3 => o_z3,
                    done => o_done,
                    
                    memory_enable => o_mem_en,
                    memory_address => o_mem_addr
                    );

        o_mem_we<='0'; --memory writing not required
end project_reti_logiche_arch;
