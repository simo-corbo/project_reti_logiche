--Progetto Finale di Reti Logiche
--A.A. 2022/23
--Progetto di Simone Corbo
--Codice Persona 10727140
--Matricola 955854
--II Consegna 1 aprile 2023

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
   signal starts: std_logic;
   
   --Components
   component DeSerializeTransform is port(
        reset: in std_logic;
        start: in std_logic;
        i_clk: in std_logic;
        input: in std_logic;
        valid: out std_logic;
        data: out std_logic_vector(15 downto 0);
        channel: out std_logic_vector(1 downto 0)
        );
    end component;
    
    
    
    begin
        DeSerT : DeSerializeTransform port map(
                 reset => i_rst, 
                 start => i_start,
                 i_clk => i_clk,
                 input => i_w
                 );   
                 
end project_reti_logiche_arch;
