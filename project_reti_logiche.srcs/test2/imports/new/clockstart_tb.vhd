
-- TB EXAMPLE PFRL 2022-2023

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
--USE std.textio.ALL;

ENTITY clockstart_tb IS
END clockstart_tb;

ARCHITECTURE clockstart_arch OF clockstart_tb IS
    CONSTANT CLOCK_PERIOD : TIME := 100 ns;
    SIGNAL tb_rst : STD_LOGIC := '0';
    SIGNAL tb_start : STD_LOGIC := '0';
    SIGNAL tb_clk : STD_LOGIC := '0';
    SIGNAL tb_w : STD_LOGIC;
    signal data: std_logic_vector(15 downto 0);
    signal channel: std_logic_vector(1 downto 0);
    signal valid: std_logic;
    --signal startshifting: std_logic;
    CONSTANT SCENARIOLENGTH : INTEGER := 35; -- 5 + 3 + 20 + 7   (RST) + (CH2-MEM[1]) + 20 CYCLES + (CH1-MEM[6])
    SIGNAL scenario_rst : unsigned(0 TO SCENARIOLENGTH - 1)     := "00110" & "000" & "00000000000000000000" & "0000000";
    SIGNAL scenario_start : unsigned(0 TO SCENARIOLENGTH - 1)   := "00000" & "111" & "00000000000000000000" & "1111100";
    SIGNAL scenario_w : unsigned(0 TO SCENARIOLENGTH - 1)       := "00000" & "101" & "00000000000000000000" & "0111000";
    -- Channel 2 -> MEM[1] -> 162
    -- Channel 1 -> MEM[2] -> 75

    COMPONENT DeSerializeTransform IS
        PORT (
        reset: in std_logic;
        start: in std_logic;
        i_clk: in std_logic;
        input: in std_logic;
        valid: out std_logic;
        data: out std_logic_vector(15 downto 0);
        channel: out std_logic_vector(1 downto 0)
        --startshifting: out std_logic

        );
    END COMPONENT DeSerializeTransform;

BEGIN
    UUT : DeSerializeTransform
    PORT MAP(tb_rst, tb_start, tb_clk, tb_w, valid, data, channel);
    


    -- Process for the clock generation
    CLK_GEN : PROCESS IS
    BEGIN
        WAIT FOR CLOCK_PERIOD/2;
        tb_clk <= NOT tb_clk;
    END PROCESS CLK_GEN;


    -- This process provides the correct scenario on the signal controlled by the TB
    createScenario : PROCESS (tb_clk)
    BEGIN
        IF tb_clk'event AND tb_clk = '0' THEN
            tb_rst <= scenario_rst(0);
            tb_w <= scenario_w(0);
            tb_start <= scenario_start(0);
            scenario_rst <= scenario_rst(1 TO SCENARIOLENGTH - 1) & '0';
            scenario_w <= scenario_w(1 TO SCENARIOLENGTH - 1) & '0';
            scenario_start <= scenario_start(1 TO SCENARIOLENGTH - 1) & '0';
        END IF;
    END PROCESS;
END clockstart_arch;
