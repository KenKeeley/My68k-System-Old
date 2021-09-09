----------------------------------------------------------------------------------------------------
--
-- FileName:    DTACK.vhd
-- Description: DTACK and WatchDog Timer.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;

ENTITY DTACK IS
  PORT
  (
    nReset : IN STD_LOGIC;                                                      -- Reset
    ClkIn : IN STD_LOGIC;                                                       -- Incoming Clock
    nAS : IN STD_LOGIC;                                                         -- Address Strobe
    nCS_RTC : IN STD_LOGIC;                                                     -- RTC Chip Select
    nCS_PS2 : IN STD_LOGIC;                                                     -- PS2 Chip Select
    nPS_OFF : IN STD_LOGIC;                                                     -- Power Off
    nCS_SRAM : IN STD_LOGIC;                                                    -- SRAM Chip Select
    nCS_ROM : IN  STD_LOGIC;                                                    -- ROM Chip Select
    nDSACK0 : OUT  STD_LOGIC;                                                   -- Data Transfer Acknowledge 0
    nBERR : OUT  STD_LOGIC                                                      -- Bus Error
  );
END DTACK;

ARCHITECTURE Behavioral OF DTACK IS
  SIGNAL Clk_Counter : UNSIGNED(5 DOWNTO 0);

BEGIN

PROCESS(ClkIn, nReset, nAS)
  BEGIN
    IF (nReset = '0' OR nAS = '1') THEN
      nDSACK0 <= 'Z';
      nBERR <= 'Z';
      Clk_Counter <= "000000";
    ELSIF RISING_EDGE(ClkIn) THEN

      -- SRAM DTACK Delay = 40ns.
      IF Clk_Counter = 2 AND nCS_SRAM = '0' THEN
        nDSACK0 <= '0';

      -- ROM DTACK Delay = 80ns.
      ELSIF Clk_Counter = 4 AND nCS_ROM = '0' THEN
        nDSACK0 <= '0';

      -- PS/2 DTACK Delay = 160ns.
      ELSIF Clk_Counter = 8 AND nCS_PS2 = '0' THEN
        nDSACK0 <= '0';

      -- RTC DTACK Delay = 200ns.
      ELSIF Clk_Counter = 10 AND nCS_RTC = '0' THEN
        nDSACK0 <= '0';

      -- PS_OFF DTACK Delay = 400ns.
      ELSIF Clk_Counter = 20 AND nPS_OFF = '0' THEN
        nDSACK0 <= '0';

      -- Watchdog Timer 1us.
      ELSIF Clk_Counter = 50 THEN
        nBERR <= '0';

      ELSE
        Clk_Counter <= Clk_Counter + 1;
      END IF;
    END IF;
END PROCESS;

END Behavioral;