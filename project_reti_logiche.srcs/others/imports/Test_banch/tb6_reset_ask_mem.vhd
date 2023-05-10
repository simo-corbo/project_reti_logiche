----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2023 11:14:07
-- Design Name: 
-- Module Name: tb6_reset_ask_mem - tb6_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
USE std.textio.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb6_reset_ask_mem is
--  Port ( );
end tb6_reset_ask_mem;

architecture tb6_arch of tb6_reset_ask_mem is
CONSTANT CLOCK_PERIOD : TIME := 100 ns;
    SIGNAL done : STD_LOGIC;
    SIGNAL address : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL i_rst : STD_LOGIC := '0';
    SIGNAL i_start : STD_LOGIC := '0';
    SIGNAL i_clk : STD_LOGIC := '0';
    SIGNAL data, mem_i_data : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL enable_wire : STD_LOGIC;
    SIGNAL mem_we : STD_LOGIC;
    SIGNAL o_z0, o_z1, o_z2, o_z3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL i_w : STD_LOGIC;

    CONSTANT SCENARIOLENGTH : INTEGER := 35; -- 5 + 3 + 4 + 7   (RST) + (CH2-MEM[1]) + (RST) + (CH1-MEM[6])
    SIGNAL scenario_rst : unsigned(0 TO SCENARIOLENGTH - 1)     := "1" & "001" & "1000" & "1110000000" & "00001000000001000";
    SIGNAL scenario_start : unsigned(0 TO SCENARIOLENGTH - 1)   := "0" & "111" & "0001" & "1111111100" & "11110000111000111";
    SIGNAL scenario_w : unsigned(0 TO SCENARIOLENGTH - 1)       := "0" & "101" & "0000" & "0111111000" & "11101010000000000";
    -- Channel 2 -> MEM[1] -> 162
    -- Channel 1 -> MEM[2] -> 75

    TYPE ram_type IS ARRAY (65535 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL RAM : ram_type := (  0 => STD_LOGIC_VECTOR(to_unsigned(2, 8)),
                                1 => STD_LOGIC_VECTOR(to_unsigned(162, 8)),
                                2 => STD_LOGIC_VECTOR(to_unsigned(75, 8)),
                                3 => STD_LOGIC_VECTOR(to_unsigned(175, 8)),
                                6 => STD_LOGIC_VECTOR(to_unsigned(88, 8)),
                                OTHERS => "00000000"-- (OTHERS => '0')
                            );
                    
    COMPONENT project_reti_logiche IS
        PORT (
            i_clk : IN STD_LOGIC;
            i_rst : IN STD_LOGIC;
            i_start : IN STD_LOGIC;
            i_w : IN STD_LOGIC;

            o_z0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            o_z1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            o_z2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            o_z3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            o_done : OUT STD_LOGIC;

            o_mem_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            i_mem_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            o_mem_we : OUT STD_LOGIC;
            o_mem_en : OUT STD_LOGIC
        );
    END COMPONENT project_reti_logiche;

BEGIN
    UUT : project_reti_logiche
    PORT MAP(
        i_clk => i_clk,
        i_start => i_start,
        i_rst => i_rst,
        i_w => i_w,

        o_z0 => o_z0,
        o_z1 => o_z1,
        o_z2 => o_z2,
        o_z3 => o_z3,
        o_done => done,

        o_mem_addr => address,
        o_mem_en => enable_wire,
        o_mem_we => mem_we,
        i_mem_data => data
    );


    -- Process for the clock generation
    CLK_GEN : PROCESS IS
    BEGIN
        WAIT FOR CLOCK_PERIOD/2;
        i_clk <= NOT i_clk;
    END PROCESS CLK_GEN;


    -- Process related to the memory
    MEM : PROCESS (i_clk)
    BEGIN
        IF i_clk'event AND i_clk = '1' THEN
            IF enable_wire = '1' THEN
                IF mem_we = '1' THEN
                    RAM(conv_integer(address)) <= mem_i_data;
                    data <= mem_i_data AFTER 1 ns;
                ELSE
                    data <= RAM(conv_integer(address)) AFTER 1 ns; 
                END IF;
                ASSERT (mem_we = '1' OR mem_we = '0') REPORT "o_mem_we in an unexpected state" SEVERITY failure;
            END IF;
            ASSERT (enable_wire = '1' OR enable_wire = '0') REPORT "o_mem_en in an unexpected state" SEVERITY failure;
        END IF;
    END PROCESS;
    
    -- This process provides the correct scenario on the signal controlled by the TB
    createScenario : PROCESS (i_clk)
    BEGIN
        IF i_clk'event AND i_clk = '0' THEN
            i_rst <= scenario_rst(0);
            i_w <= scenario_w(0);
            i_start <= scenario_start(0);
            scenario_rst <= scenario_rst(1 TO SCENARIOLENGTH - 1) & '0';
            scenario_w <= scenario_w(1 TO SCENARIOLENGTH - 1) & '0';
            scenario_start <= scenario_start(1 TO SCENARIOLENGTH - 1) & '0';
        END IF;
    END PROCESS;

    -- Process without sensitivity list designed to test the actual component.
    testRoutine : PROCESS IS
    BEGIN
        mem_i_data <= "00000000";
        -- wait for 10000 ns;
        WAIT UNTIL i_rst = '1';
        WAIT UNTIL i_rst = '0';
        ASSERT done = '0' REPORT "TEST FALLITO (postreset DONE != 0 )" SEVERITY failure;
        ASSERT o_z0 = "00000000" REPORT "TEST FALLITO (postreset Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z0))) severity failure; 
        ASSERT o_z1 = "00000000" REPORT "TEST FALLITO (postreset Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z1))) severity failure; 
        ASSERT o_z2 = "00000000" REPORT "TEST FALLITO (postreset Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z2))) severity failure; 
        ASSERT o_z3 = "00000000" REPORT "TEST FALLITO (postreset Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z3))) severity failure; 
        WAIT UNTIL i_start = '1';
        ASSERT o_z0 = "00000000" REPORT "TEST FALLITO (poststart Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z0))) severity failure; 
        ASSERT o_z1 = "00000000" REPORT "TEST FALLITO (poststart Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z1))) severity failure; 
        ASSERT o_z2 = "00000000" REPORT "TEST FALLITO (poststart Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z2))) severity failure; 
        ASSERT o_z3 = "00000000" REPORT "TEST FALLITO (poststart Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z3))) severity failure; 
        WAIT UNTIL i_rst = '1';
        ASSERT o_z0 = "00000000" REPORT "TEST FALLITO (poststart Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z0))) severity failure; 
        ASSERT o_z1 = "00000000" REPORT "TEST FALLITO (poststart Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z1))) severity failure; 
        ASSERT o_z2 = "00000000" REPORT "TEST FALLITO (poststart Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z2))) severity failure; 
        ASSERT o_z3 = "00000000" REPORT "TEST FALLITO (poststart Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z3))) severity failure; 
        WAIT UNTIL i_rst = '0';
        --WAIT UNTIL rising_edge(i_clk);
        WAIT FOR CLOCK_PERIOD/2;
  
        WAIT FOR CLOCK_PERIOD/2;
        ASSERT o_z0 = "00000000" REPORT "TEST FALLITO (postdone Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z0))) severity failure; 
        ASSERT o_z1 = "00000000" REPORT "TEST FALLITO (postdone Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z1))) severity failure; 
        ASSERT o_z2 = "00000000" REPORT "TEST FALLITO (postdone Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z2))) severity failure; 
        ASSERT o_z3 = "00000000" REPORT "TEST FALLITO (postdone Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z3))) severity failure; 
        WAIT UNTIL i_start = '1';
        ASSERT o_z0 = "00000000" REPORT "TEST FALLITO (postdone Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z0))) severity failure; 
        ASSERT o_z1 = "00000000" REPORT "TEST FALLITO (postdone Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z1))) severity failure; 
        ASSERT o_z2 = "00000000" REPORT "TEST FALLITO (postdone Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z2))) severity failure; 
        ASSERT o_z3 = "00000000" REPORT "TEST FALLITO (postdone Z0--Z3 != 0 ) found " & integer'image(to_integer(unsigned(o_z3))) severity failure; 
        WAIT UNTIL done = '1';
        
        --WAIT UNTIL rising_edge(i_clk);
        WAIT FOR CLOCK_PERIOD/2;

--        ASSERT o_z3 = std_logic_vector(to_unsigned(88, 8))  REPORT "TEST FALLITO (Z3 ---) found " & integer'image(to_integer(unsigned(o_z3))) severity failure; --. Expected  209  found " & integer'image(o_z0))))  severity failure;
        wait until done='0';
        wait until done='1';
                wait until done='0';

        ASSERT false REPORT "Simulation Ended! TEST PASSATO (EXAMPLE)" SEVERITY failure;
    END PROCESS testRoutine;


end tb6_arch;
