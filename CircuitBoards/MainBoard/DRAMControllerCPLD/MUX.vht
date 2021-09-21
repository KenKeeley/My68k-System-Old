----------------------------------------------------------------------------------------------------
--
-- FileName:    MUX.vht
-- Description: MainBoard DRAM Controller CPLD Multiplexer Test Bench.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MUX_TB IS
END MUX_TB;

ARCHITECTURE Behavior OF MUX_TB IS

  -- Component Declaration for the Multiplexer
  COMPONENT Multiplexer
    PORT (
      Address : IN STD_LOGIC_VECTOR (23 DOWNTO 0);                              -- Address Bus
      nRAS : IN STD_LOGIC_VECTOR (7 DOWNTO 0);                                  -- Row Address Select
      MA : OUT STD_LOGIC_VECTOR (11 DOWNTO 0)                                   -- Multiplexed Address Bus
    );
  END COMPONENT;

  -- Inputs
  SIGNAL Clk : STD_LOGIC := '1';
  SIGNAL Address : STD_LOGIC_VECTOR (23 DOWNTO 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZ";
  SIGNAL nRAS : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"FF";

  -- Outputs
  SIGNAL MA : STD_LOGIC_VECTOR (11 DOWNTO 0);

  -- Clock Period Definition
  CONSTANT clk_period : TIME := 40 NS;

BEGIN

  -- Instantiate the Multiplexer
  UUT : Multiplexer PORT MAP (
    Address => Address,
    nRAS => nRAS,
    MA => MA
  );

  -- Clock Process Definition
  Clock_Process: PROCESS
  BEGIN
    Clk <= '1';
    WAIT FOR clk_period/2;
    Clk <= '0';
    WAIT FOR clk_period/2;
  END PROCESS;

  -- Stimulus Process Definition
  Stimulus_Process: PROCESS
  BEGIN
      WAIT FOR 20 NS;

    -- Reset the Controller
    REPORT "000 Reset the Controller";
    WAIT FOR 80 NS;
    WAIT FOR 220 NS;

    -- Random Mode Long Word READ
    REPORT "001 start Random Mode Long Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode Long Word Write
    REPORT "002 start Random Mode Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 1st Word READ
    REPORT "003 start Random Mode 1st Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 1st Word Write
    REPORT "004 start Random Mode 1st Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 2nd Word READ
    REPORT "005 start Random Mode 2nd Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 2nd Word Write
    REPORT "006 start Random Mode 2nd Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 1st Byte READ
    REPORT "007 start Random 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 2nd Byte Write
    REPORT "008 start Random Mode 2nd Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 3rd Byte READ
    REPORT "009 start Random 3rd Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 4th Byte Write
    REPORT "010 start Random Mode 4th Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Pause between Testing Banks.
    WAIT FOR 30 NS;
    nRAS <= X"FF";
    WAIT FOR 40 NS;
    WAIT FOR 130 NS;

    -- Random Mode Long Word READ
    REPORT "011 start Random Mode Long Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nRAS <= X"FD";
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode Long Word Write
    REPORT "012 start Random Mode Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FD";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 1st Word READ
    REPORT "013 start Random Mode 1st Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FD";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 1st Word Write
    REPORT "014 start Random Mode 1st Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FD";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 2nd Word READ
    REPORT "015 start Random Mode 2nd Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FD";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 2nd Word Write
    REPORT "016 start Random Mode 2nd Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FD";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 1st Byte READ
    REPORT "017 start Random 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FD";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 2nd Byte Write
    REPORT "018 start Random Mode 2nd Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FD";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 3rd Byte READ
    REPORT "019 start Random 3rd Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FD";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Random Mode 4th Byte Write
    REPORT "020 start Random Mode 4th Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FD";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Pause before testing Fast Page Mode.
    WAIT FOR 30 NS;
    nRAS <= X"FF";
    WAIT FOR 40 NS;
    WAIT FOR 130 NS;

    -- Random Mode 1st Byte READ
    REPORT "007 start Random 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Page Mode 1st Long Word Write
    REPORT "101 start Page Mode 1st Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1004";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Page Mode 2nd Long Word Write
    REPORT "102 start Page Mode 2nd Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1008";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Page Mode 3rd Long Word Write
    REPORT "103 start Page Mode 3rd Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C100C";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Page Mode 4th Long Word Write
    REPORT "104 start Page Mode 4th Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C1010";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Page Mode 5th Long Word Write, Different Page
    REPORT "105 start Page Mode 5th Long Word Write, Different Page";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nRAS <= X"FF";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    --Wait until Refresh Starts.
    WAIT FOR 30 NS;
    nRAS <= X"FF";
    WAIT FOR 40 NS;
    WAIT FOR 10070 NS;
    nRAS <= X"00";
    WAIT FOR 80 NS;
    nRAS <= X"FF";
    WAIT FOR 20 NS;

    -- Random Mode 1st Byte READ
    REPORT "200 start Refresh Test 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"3C3000";
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nRAS <= X"FE";
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";
    WAIT FOR 30 NS;
    nRAS <= X"FF";
    WAIT FOR 40 NS;

    WAIT;
  END PROCESS;

END Behavior;