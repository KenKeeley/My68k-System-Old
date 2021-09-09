----------------------------------------------------------------------------------------------------
--
-- FileName:    DTACK.vht
-- Description: DTACK and WatchDog Timer Test Bench.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY DTACK_TB IS
END DTACK_TB;

ARCHITECTURE Behavior OF DTACK_TB IS

  -- Component Declaration for the DTACK
  COMPONENT DTACK
    PORT (
      nReset : IN STD_LOGIC;                                                    -- Reset
      ClkIn : IN STD_LOGIC;                                                     -- Incoming Clock
      nAS : IN STD_LOGIC;                                                       -- Address Strobe
      nCS_RTC : IN STD_LOGIC;                                                   -- RTC Chip Select
      nCS_PS2 : IN STD_LOGIC;                                                   -- PS2 Chip Select
      nPS_OFF : IN STD_LOGIC;                                                   -- Power Off
      nCS_SRAM : IN STD_LOGIC;                                                  -- SRAM Chip Select
      nCS_ROM : IN STD_LOGIC;                                                   -- ROM Chip Select
      nDSACK0 : OUT STD_LOGIC;                                                  -- Data Transfer Acknowledge 0
      nBERR : OUT  STD_LOGIC                                                    -- Bus Error
    );
  END COMPONENT;

  -- Inputs
  SIGNAL nReset : STD_LOGIC := '0';
  SIGNAL ClkIn : STD_LOGIC := '0';
  SIGNAL nAS : STD_LOGIC := '1';
  SIGNAL nCS_RTC : STD_LOGIC := '1';
  SIGNAL nCS_PS2 : STD_LOGIC := '1';
  SIGNAL nPS_OFF : STD_LOGIC := '1';
  SIGNAL nCS_SRAM : STD_LOGIC := '1';
  SIGNAL nCS_ROM : STD_LOGIC := '1';

  -- Outputs
  SIGNAL nDSACK0 : STD_LOGIC;
  SIGNAL nBERR : STD_LOGIC;

  -- Clock Period Definition
  CONSTANT clk_period : TIME := 20 NS;

BEGIN

  -- Instantiate the DTACK
  UUT : DTACK PORT MAP (
    nReset => nReset,
    ClkIn => ClkIn,
    nAS => nAS,
    nCS_RTC => nCS_RTC,
    nCS_PS2 => nCS_PS2,
    nPS_OFF => nPS_OFF,
    nCS_SRAM => nCS_SRAM,
    nCS_ROM => nCS_ROM,
    nDSACK0 => nDSACK0,
    nBERR => nBERR
  );

  -- Clock Process Definition
  Clock_Process: PROCESS
  BEGIN
    ClkIn <= '0';
    WAIT FOR clk_period/2;
    ClkIn <= '1';
    WAIT FOR clk_period/2;
  END PROCESS;

  -- Stimulus Process Definition
  Stimulus_Process: PROCESS
  BEGIN

    WAIT FOR 45 NS;
    nReset <= '1';

    WAIT FOR 10 NS;
    nAS <= '0';
    nCS_RTC <= '0';
    WAIT FOR 295 NS;
    nAS <= '1';
    nCS_RTC <= '1';

    WAIT FOR 10 NS;
    nAS <= '0';
    nCS_PS2 <= '0';
    WAIT FOR 295 NS;
    nAS <= '1';
    nCS_PS2 <= '1';

    WAIT FOR 10 NS;
    nAS <= '0';
    nPS_OFF <= '0';
    WAIT FOR 595 NS;
    nAS <= '1';
    nPS_OFF <= '1';

    WAIT FOR 10 NS;
    nAS <= '0';
    nCS_SRAM <= '0';
    WAIT FOR 295 NS;
    nAS <= '1';
    nCS_SRAM <= '1';

    WAIT FOR 10 NS;
    nAS <= '0';
    nCS_ROM <= '0';
    WAIT FOR 295 NS;
    nAS <= '1';
    nCS_ROM <= '1';

    WAIT FOR 10 NS;
    nAS <= '0';

    WAIT;
  END PROCESS;

END Behavior;