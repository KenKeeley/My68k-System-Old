----------------------------------------------------------------------------------------------------
--
-- FileName:    StateMachine.vht
-- Description: MainBoard DRAM Controller CPLD State Machine Test Bench.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY StateMachine_TB IS
END StateMachine_TB;

ARCHITECTURE Behavior OF StateMachine_TB IS

  -- Component Declaration for the State Machine
  COMPONENT StateMachine
    PORT (
      Clk : IN STD_LOGIC;                                                       -- Clock
      nReset : IN STD_LOGIC;                                                    -- Reset
      nWR : IN STD_LOGIC;                                                       -- CPU Read/Write signal
      nCS_DRAM : IN STD_LOGIC;                                                  -- DRAM Chip Select
      nPage_Hit : IN STD_LOGIC;                                                 -- Request is in Same Page
      nBank : IN STD_LOGIC_VECTOR (7 DOWNTO 0);                                 -- DRAM Bank to Address
      nByte : IN STD_LOGIC_VECTOR (3 DOWNTO 0);                                 -- Byte/s Selected
      nPreCharge : OUT STD_LOGIC;                                               -- Flag to show when in PreCharge
      nDSACK0 : OUT STD_LOGIC;                                                  -- Data size/ack signal 0 to CPU
      nDSACK1 : OUT STD_LOGIC;                                                  -- Data size/ack signal 1 to CPU
      nRAS : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);                                 -- Row Address Select
      nCAS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);                                 -- Column Address Select
      nWE_DRAM : OUT STD_LOGIC                                                  -- DRAM Read/Write signal
    );
  END COMPONENT;

  -- Inputs
  SIGNAL Clk : STD_LOGIC := '1';
  SIGNAL nReset : STD_LOGIC := 'Z';
  SIGNAL nWR : STD_LOGIC := 'Z';
  SIGNAL nCS_DRAM : STD_LOGIC := '1';
  SIGNAL nPage_Hit : STD_LOGIC := '1';
  SIGNAL nBank : STD_LOGIC_VECTOR (7 DOWNTO 0) := "11111111";
  SIGNAL nByte : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1111";

  -- Outputs
  SIGNAL nPreCharge : STD_LOGIC;
  SIGNAL nDSACK0 : STD_LOGIC;
  SIGNAL nDSACK1 : STD_LOGIC;
  SIGNAL nRAS : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL nCAS : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL nWE_DRAM : STD_LOGIC;

  -- Clock Period Definition
  CONSTANT clk_period : TIME := 40 NS;

BEGIN

  -- Instantiate the State Machine
  UUT : StateMachine PORT MAP (
    Clk => Clk,
    nReset => nReset,
    nWR => nWR,
    nCS_DRAM => nCS_DRAM,
    nPage_Hit => nPage_Hit,
    nBank => nBank,
    nByte => nByte,
    nPreCharge => nPreCharge,
    nDSACK0 => nDSACK0,
    nDSACK1 => nDSACK1,
    nRAS => nRAS,
    nCAS => nCAS,
    nWE_DRAM => nWE_DRAM
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
    nReset <= '0';
    WAIT FOR 80 NS;
    nReset <= '1';
    WAIT FOR 220 NS;

    -- Random Mode Long Word READ
    REPORT "001 start Random Mode Long Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"0";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode Long Word Write
    REPORT "002 start Random Mode Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"0";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 1st Word READ
    REPORT "003 start Random Mode 1st Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"3";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 1st Word Write
    REPORT "004 start Random Mode 1st Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"3";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 2nd Word READ
    REPORT "005 start Random Mode 2nd Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"C";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 2nd Word Write
    REPORT "006 start Random Mode 2nd Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"C";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 1st Byte READ
    REPORT "007 start Random 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"7";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 2nd Byte Write
    REPORT "008 start Random Mode 2nd Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"B";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 3rd Byte READ
    REPORT "009 start Random 3rd Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"D";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 4th Byte Write
    REPORT "010 start Random Mode 4th Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"E";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Pause between Testing Banks.
    WAIT FOR 200 NS;

    -- Random Mode Long Word READ
    REPORT "011 start Random Mode Long Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FD";
    nByte <= X"0";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode Long Word Write
    REPORT "012 start Random Mode Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FD";
    nByte <= X"0";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 1st Word READ
    REPORT "013 start Random Mode 1st Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FD";
    nByte <= X"3";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 1st Word Write
    REPORT "014 start Random Mode 1st Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FD";
    nByte <= X"3";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 2nd Word READ
    REPORT "015 start Random Mode 2nd Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FD";
    nByte <= X"C";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 2nd Word Write
    REPORT "016 start Random Mode 2nd Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FD";
    nByte <= X"C";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 1st Byte READ
    REPORT "017 start Random 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FD";
    nByte <= X"7";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 2nd Byte Write
    REPORT "018 start Random Mode 2nd Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FD";
    nByte <= X"B";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 3rd Byte READ
    REPORT "019 start Random 3rd Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FD";
    nByte <= X"D";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Random Mode 4th Byte Write
    REPORT "020 start Random Mode 4th Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FD";
    nByte <= X"E";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Pause before testing Fast Page Mode.
    WAIT FOR 200 NS;

    -- Random Mode 1st Byte READ
    REPORT "007 start Random 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"7";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Page Mode 1st Long Word Write
    REPORT "101 start Page Mode 1st Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"0";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    -- Page Mode 2nd Long Word Write
    REPORT "102 start Page Mode 2nd Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    nPage_Hit <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"0";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';
    nPage_Hit <= '1';

    -- Page Mode 3rd Long Word Write
    REPORT "103 start Page Mode 3rd Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    nPage_Hit <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"0";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';
    nPage_Hit <= '1';

    -- Page Mode 4th Long Word Write
    REPORT "104 start Page Mode 4th Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    nPage_Hit <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"0";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';
    nPage_Hit <= '1';

    -- Page Mode 5th Long Word Write, Different Page
    REPORT "105 start Page Mode 5th Long Word Write, Different Page";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"0";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    --Wait until Refresh Starts.
    WAIT FOR 10240 NS;

    -- Random Mode 1st Byte READ
    REPORT "200 start Refresh Test 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '0';
    nBank <= X"FE";
    nByte <= X"7";
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0 = '0' AND nDSACK1 = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nCS_DRAM <= '1';
    nBank <= X"FF";
    nByte <= X"F";

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nWR <= 'Z';

    WAIT;
  END PROCESS;

END Behavior;