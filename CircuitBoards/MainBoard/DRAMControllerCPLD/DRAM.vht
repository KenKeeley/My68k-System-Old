----------------------------------------------------------------------------------------------------
--
-- FileName:    DRAM.vht
-- Description: MainBoard DRAM Controller CPLD Top Level Test Bench.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY DRAMController_TB IS
END DRAMController_TB;

ARCHITECTURE Behavior OF DRAMController_TB IS

  -- Component Declaration for the DRAM Controller
  COMPONENT DRAMController
    PORT (
      Clk : IN STD_LOGIC;                                                       -- Clock
      nReset : IN STD_LOGIC;                                                    -- Reset
      Address : IN STD_LOGIC_VECTOR (31 DOWNTO 0);                              -- Address Bus
      nAS : IN STD_LOGIC;                                                       -- CPU Address signal
      nSIZ0 : IN STD_LOGIC;                                                     -- CPU SIZ 0 signal
      nSIZ1 : IN STD_LOGIC;                                                     -- CPU SIZ 1 signal
      Func : IN STD_LOGIC_VECTOR (1 DOWNTO 0);                                  -- CPU Function Signals
      nWR : IN STD_LOGIC;                                                       -- CPU Read/Write signal
      nCS_ROM : IN  STD_LOGIC;                                                  -- ROM Chip Select
      nDSACK0_OUT : OUT STD_LOGIC;                                              -- CPU DSACK 0 signal
      nDSACK1_OUT : OUT STD_LOGIC;                                              -- CPU DSACK 1 signal
      MA : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);                                  -- Multiplexed Address Bus
      nRAS_DRAM : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);                            -- Row Address Select
      nCAS_DRAM : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);                            -- Column Address Select
      nWE_DRAM : OUT STD_LOGIC                                                  -- DRAM Read/Write signal
    );
  END COMPONENT;

  -- Inputs
  SIGNAL Clk : STD_LOGIC := '1';
  SIGNAL nReset : STD_LOGIC := 'Z';
  SIGNAL Address : STD_LOGIC_VECTOR (31 DOWNTO 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
  SIGNAL Func : STD_LOGIC_VECTOR (1 DOWNTO 0) := "ZZ";
  SIGNAL nAS : STD_LOGIC := '1';
  SIGNAL nSIZ0 : STD_LOGIC := 'Z';
  SIGNAL nSIZ1 : STD_LOGIC := 'Z';
  SIGNAL nWR : STD_LOGIC := 'Z';
  SIGNAL nCS_ROM : STD_LOGIC := '1';

  -- Outputs
  SIGNAL nDSACK0_OUT : STD_LOGIC;
  SIGNAL nDSACK1_OUT : STD_LOGIC;
  SIGNAL MA : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL nRAS_DRAM : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL nCAS_DRAM : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL nWE_DRAM : STD_LOGIC;

  -- Clock Period Definition
  CONSTANT clk_period : TIME := 40 NS;

BEGIN

  -- Instantiate the DRAM Controller
  UUT : DRAMController PORT MAP (
    Clk => Clk,
    nReset => nReset,
    Address => Address,
    nAS => nAS,
    nSIZ0 => nSIZ0,
    nSIZ1 => nSIZ1,
    Func => Func,
    nWR => nWR,
    nCS_ROM => nCS_ROM,
    nDSACK0_OUT => nDSACK0_OUT,
    nDSACK1_OUT => nDSACK1_OUT,
    MA => MA,
    nRAS_DRAM => nRAS_DRAM,
    nCAS_DRAM => nCAS_DRAM,
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
    Address <=  X"00F0C000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode Long Word Write
    REPORT "002 start Random Mode Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 1st Word READ
    REPORT "003 start Random Mode 1st Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 1st Word Write
    REPORT "004 start Random Mode 1st Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 2nd Word READ
    REPORT "005 start Random Mode 2nd Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C002";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 2nd Word Write
    REPORT "006 start Random Mode 2nd Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04002";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 1st Byte READ
    REPORT "007 start Random 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C000";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 2nd Byte Write
    REPORT "008 start Random Mode 2nd Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04001";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 3rd Byte READ
    REPORT "009 start Random 3rd Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C002";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 4th Byte Write
    REPORT "010 start Random Mode 4th Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04003";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Pause between Testing Banks.
    WAIT FOR 200 NS;

    -- Random Mode Long Word READ
    REPORT "011 start Random Mode Long Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F0C000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode Long Word Write
    REPORT "012 start Random Mode Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F04000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 1st Word READ
    REPORT "013 start Random Mode 1st Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F0C000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 1st Word Write
    REPORT "014 start Random Mode 1st Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F04000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 2nd Word READ
    REPORT "015 start Random Mode 2nd Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F0C002";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 2nd Word Write
    REPORT "016 start Random Mode 2nd Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F04002";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 1st Byte READ
    REPORT "017 start Random 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F0C000";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 2nd Byte Write
    REPORT "018 start Random Mode 2nd Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F04001";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 3rd Byte READ
    REPORT "019 start Random 3rd Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F0C002";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Random Mode 4th Byte Write
    REPORT "020 start Random Mode 4th Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F04003";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Pause before testing Fast Page Mode.
    WAIT FOR 200 NS;

    -- Random Mode 1st Byte READ
    REPORT "007 start Random 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C000";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Page Mode 1st Long Word Write
    REPORT "101 start Page Mode 1st Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04010";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Page Mode 2nd Long Word Write
    REPORT "102 start Page Mode 2nd Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04020";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Page Mode 3rd Long Word Write
    REPORT "103 start Page Mode 3rd Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04030";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Page Mode 4th Long Word Write
    REPORT "104 start Page Mode 4th Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04040";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    -- Page Mode 5th Long Word Write, Different Page
    REPORT "105 start Page Mode 5th Long Word Write, Different Page";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    nWR <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    --Wait until Refresh Starts.
    WAIT FOR 10240 NS;

    -- Random Mode 1st Byte READ
    REPORT "200 start Refresh Test 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C000";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    nWR <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    WAIT UNTIL nDSACK0_OUT = '0' AND nDSACK1_OUT = '0';
    -- CPU State 4
    WAIT UNTIL Clk = '1';
    -- CPU State 5
    WAIT UNTIL Clk = '0';
    nAS <= '1';

    -- Wait Before Next Process.
    WAIT FOR 10 NS;
    nSIZ0 <= 'Z';
    nSIZ1 <= 'Z';
    Func <= "ZZ";
    Address <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    nWR <= 'Z';

    WAIT;
  END PROCESS;

END Behavior;