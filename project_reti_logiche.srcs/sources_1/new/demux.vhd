library IEEE;
use IEEE.std_logic_1164.all;
 
entity s_demux is
 port(
 data : in std_logic_vector(7 downto 0);
 channel: in std_logic_vector(1 downto 0);
 enable: in std_logic;
 reset: in std_logic;
 z0, z1, z2 ,z3: out std_logic_vector(7 downto 0)
 );
end s_demux;
 
architecture arch_demux of s_demux is
    signal internal_z0: std_logic_vector(7 downto 0):=(others=>'0');
    signal internal_z1: std_logic_vector(7 downto 0):=(others=>'0');
    signal internal_z2: std_logic_vector(7 downto 0):=(others=>'0');
    signal internal_z3: std_logic_vector(7 downto 0):=(others=>'0');

begin
    channel_trigger: process (data, channel) is
        begin
         if (channel = "00") then
            z0 <= data;
         elsif (channel="01") then
            z1 <= data;
         elsif (channel="10") then
            z2 <= data;
         else
            z3 <= data;
         end if;
    end process;
    
    reset_trigger: process(reset)
    begin
        if(rising_edge(reset)) then
            internal_z0<=(others=>'0');
            internal_z1<=(others=>'0');
            internal_z2<=(others=>'0');
            internal_z3<=(others=>'0');
        end if;
    end process; 
    
    enable_trigger: process(enable)
    begin
        if(enable='0') then
            z0<=(others=>'0');
            z1<=(others=>'0');
            z2<=(others=>'0');
            z3<=(others=>'0');
        else
            z0<=internal_z0;
            z1<=internal_z1;
            z2<=internal_z2;
            z3<=internal_z3;
        end if;
    end process;
    
    
    
    
    
         
         
end arch_demux;