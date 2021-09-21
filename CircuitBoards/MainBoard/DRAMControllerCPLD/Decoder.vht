----------------------------------------------------------------------------------------------------
--
-- FileName:    Decoder.vht
-- Description: MainBoard DRAM Controller CPLD Decoder Test Bench.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Decoder_TB IS
END Decoder_TB;

ARCHITECTURE Behavior OF Decoder_TB IS

  -- Component Declaration for the Decoder
  COMPONENT Decoder
    PORT (
      nReset : IN STD_LOGIC;                                                    -- Reset
      nAS : IN STD_LOGIC;                                                       -- CPU Address signal
      nSIZ0 : IN STD_LOGIC;                                                     -- CPU SIZ 0 signal
      nSIZ1 : IN STD_LOGIC;                                                     -- CPU SIZ 1 signal
      nPreCharge : IN STD_LOGIC;                                                -- Flag to show when in PreCharge
      Func : IN STD_LOGIC_VECTOR (1 DOWNTO 0);                                  -- CPU Function Signals
      Address : IN STD_LOGIC_VECTOR (31 DOWNTO 0);                              -- Address Bus
      nCS_ROM : IN  STD_LOGIC;                                                  -- ROM Chip Select
      nBank : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);                                -- DRAM Bank to Address
      nByte : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);                                -- Byte/s Selected
      nCS_DRAM : OUT STD_LOGIC;                                                 -- DRAM Chip Select
      nPage_Hit : OUT STD_LOGIC                                                 -- Request is in Same Page
    );
  END COMPONENT;

  -- Inputs
  SIGNAL Clk : STD_LOGIC := '1';
  SIGNAL nReset : STD_LOGIC := 'Z';
  SIGNAL nAS : STD_LOGIC := '1';
  SIGNAL nSIZ0 : STD_LOGIC := 'Z';
  SIGNAL nSIZ1 : STD_LOGIC := 'Z';
  SIGNAL nPreCharge : STD_LOGIC := '1';
  SIGNAL Func : STD_LOGIC_VECTOR (1 DOWNTO 0) := "ZZ";
  SIGNAL Address : STD_LOGIC_VECTOR (31 DOWNTO 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
  SIGNAL nCS_ROM : STD_LOGIC := '1';

  -- Outputs
  SIGNAL nBank : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL nByte : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL nCS_DRAM : STD_LOGIC;
  SIGNAL nPage_Hit : STD_LOGIC;

  -- Clock Period Definition
  CONSTANT clk_period : TIME := 40 NS;

BEGIN

  -- Instantiate the Decoder
  UUT : Decoder PORT MAP (
    nReset => nReset,
    nAS => nAS,
    nSIZ0 => nSIZ0,
    nSIZ1 => nSIZ1,
    nPreCharge => nPreCharge,
    Func => Func,
    Address => Address,
    nCS_ROM => nCS_ROM,
    nBank => nBank,
    nByte => nByte,
    nCS_DRAM => nCS_DRAM,
    nPage_Hit => nPage_Hit
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
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
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

    -- Random Mode Long Word Write
    REPORT "002 start Random Mode Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 1st Word READ
    REPORT "003 start Random Mode 1st Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 1st Word Write
    REPORT "004 start Random Mode 1st Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 2nd Word READ
    REPORT "005 start Random Mode 2nd Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C002";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 2nd Word Write
    REPORT "006 start Random Mode 2nd Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04002";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 1st Byte READ
    REPORT "007 start Random 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C000";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 2nd Byte Write
    REPORT "008 start Random Mode 2nd Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04001";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 3rd Byte READ
    REPORT "009 start Random 3rd Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C002";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 4th Byte Write
    REPORT "010 start Random Mode 4th Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04003";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Pause between Testing Banks.
    WAIT FOR 30 NS;
    nPreCharge <= '0';
    WAIT FOR 40 NS;
    nPreCharge <= '1';
    WAIT FOR 130 NS;

    -- Random Mode Long Word READ
    REPORT "011 start Random Mode Long Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F0C000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode Long Word Write
    REPORT "012 start Random Mode Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F04000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 1st Word READ
    REPORT "013 start Random Mode 1st Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F0C000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 1st Word Write
    REPORT "014 start Random Mode 1st Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F04000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 2nd Word READ
    REPORT "015 start Random Mode 2nd Word READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F0C002";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 2nd Word Write
    REPORT "016 start Random Mode 2nd Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F04002";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '1';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 1st Byte READ
    REPORT "017 start Random 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F0C000";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 2nd Byte Write
    REPORT "018 start Random Mode 2nd Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F04001";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 3rd Byte READ
    REPORT "019 start Random 3rd Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F0C002";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Random Mode 4th Byte Write
    REPORT "020 start Random Mode 4th Byte Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"04F04003";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Pause before testing Fast Page Mode.
    WAIT FOR 30 NS;
    nPreCharge <= '0';
    WAIT FOR 40 NS;
    nPreCharge <= '1';
    WAIT FOR 130 NS;

    -- Random Mode 1st Byte READ
    REPORT "007 start Random 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C000";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
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

    -- Page Mode 1st Long Word Write
    REPORT "101 start Page Mode 1st Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04010";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    -- Page Mode 2nd Long Word Write
    REPORT "102 start Page Mode 2nd Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04020";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
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

    -- Page Mode 3rd Long Word Write
    REPORT "103 start Page Mode 3rd Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04030";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
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

    -- Page Mode 4th Long Word Write
    REPORT "104 start Page Mode 4th Long Word Write";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F04040";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
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

    -- Page Mode 5th Long Word Write, Different Page
    REPORT "105 start Page Mode 5th Long Word Write, Different Page";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C000";
    Func <= "01";
    nSIZ0 <= '0';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '0';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
    nPreCharge <= '1';
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

    --Wait until Refresh Starts.
    WAIT FOR 30 NS;
    nPreCharge <= '0';
    WAIT FOR 40 NS;
    nPreCharge <= '1';
    WAIT FOR 10150 NS;
    nPreCharge <= '0';
    WAIT FOR 20 NS;

    -- Random Mode 1st Byte READ
    REPORT "200 start Refresh Test 1st Byte READ";
    -- CPU State 0
    WAIT UNTIL Clk = '1';
    Address <=  X"00F0C000";
    Func <= "01";
    nSIZ0 <= '1';
    nSIZ1 <= '0';
    -- CPU State 1
    WAIT UNTIL Clk = '0';
    nAS <= '0';
    nPreCharge <= '1';
    -- CPU State 2
    WAIT UNTIL Clk = '1';
    -- CPU State 3
    WAIT UNTIL Clk = '0';
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
    WAIT FOR 30 NS;
    nPreCharge <= '0';
    WAIT FOR 40 NS;
    nPreCharge <= '1';

    WAIT;
  END PROCESS;

END Behavior;