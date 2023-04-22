
-- TB EXAMPLE PFRL 2022-2023

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
--USE std.textio.ALL;

ENTITY DeSerT_test IS
END DeSerT_test;

ARCHITECTURE DeSerT_test_arch OF DeSerT_test IS
    CONSTANT CLOCK_PERIOD : TIME := 100 ns;
    SIGNAL tb_rst : STD_LOGIC := '0';
    SIGNAL tb_start : STD_LOGIC := '0';
    SIGNAL tb_clk : STD_LOGIC := '0';
    SIGNAL tb_w : STD_LOGIC;

    signal address: std_logic_vector(15 downto 0);
    signal channel: std_logic_vector(1 downto 0);
    signal valid_input: std_logic;
    
    CONSTANT SCENARIOLENGTH : INTEGER := 35; -- 5 + 3 + 20 + 7   (RST) + (CH2-MEM[1]) + 20 CYCLES + (CH1-MEM[6])
    SIGNAL scenario_rst : unsigned(0 TO SCENARIOLENGTH - 1)     := "00110" & "000" & "00000000000000000000" & "0000000";
    SIGNAL scenario_start : unsigned(0 TO SCENARIOLENGTH - 1)   := "00000" & "111" & "00000000000000000000" & "1111100";
    SIGNAL scenario_w : unsigned(0 TO SCENARIOLENGTH - 1)       := "00000" & "101" & "00000000000000000000" & "0111000";

    COMPONENT DeSerializeTransform IS
    port(
        reset: in std_logic;                        		--reset signal from input
        start: in std_logic;                       			--start sequence channel(1), channel(0), (data)
        i_clk: in std_logic;                        		--clock signal
        input: in std_logic;                        		--input data
        
        valid_input: out std_logic;                       	--valid_input output
        address: out std_logic_vector(15 downto 0);    		--output memory address
        channel: out std_logic_vector(1 downto 0)   		--output channel   
        );
    END COMPONENT DeSerializeTransform;

BEGIN
    UUT : DeSerializeTransform port map(
                 reset => tb_rst, 
                 start => tb_start,
                 i_clk => tb_clk,
                 input => tb_w,
                                  
                 valid_input=>valid_input,
                 address=>address, 
                 channel=>channel
                 );


    


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
END DeSerT_test_arch;
