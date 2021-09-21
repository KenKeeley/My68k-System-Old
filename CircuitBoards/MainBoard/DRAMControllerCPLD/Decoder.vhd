----------------------------------------------------------------------------------------------------
--
-- FileName:    Decoder.vhd
-- Description: MainBoard DRAM Controller CPLD Decoder.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;

ENTITY Decoder IS
  PORT
  (
    nReset : IN STD_LOGIC;                                                       -- Reset
    nAS : IN STD_LOGIC;                                                          -- CPU Address signal
    nSIZ0 : IN STD_LOGIC;                                                        -- CPU SIZ 0 signal
    nSIZ1 : IN STD_LOGIC;                                                        -- CPU SIZ 1 signal
    nPreCharge : IN STD_LOGIC;                                                   -- Flag to show when in PreCharge
    Func : IN STD_LOGIC_VECTOR (1 DOWNTO 0);                                     -- CPU Function Signals
    Address : IN STD_LOGIC_VECTOR (31 DOWNTO 0);                                 -- Address Bus
    nCS_ROM : IN  STD_LOGIC;                                                     -- ROM Chip Select
    nBank : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);                                   -- DRAM Bank to Address
    nByte : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);                                   -- Byte/s Selected
    nCS_DRAM : BUFFER STD_LOGIC;                                                 -- DRAM Chip Select
    nPage_Hit : OUT STD_LOGIC                                                    -- Request is in Same Page
  );
END Decoder;

ARCHITECTURE Behavioral OF Decoder IS

  -- Internal Signals
  SIGNAL PreRow : STD_LOGIC_VECTOR(17 DOWNTO 0);

BEGIN

  -- Record Previous Address
  Previous_Address: PROCESS (nAS, nReset, nPreCharge)
  BEGIN
    IF (nReset = '0' OR nPreCharge = '0') THEN
      PreRow <= "111111111111111111";
    ELSIF RISING_EDGE(nAS) THEN
      PreRow(17 DOWNTO 11) <= Address(31 DOWNTO 25);
      PreRow(10 DOWNTO 0) <= Address(23 DOWNTO 13);
    END IF;
  END PROCESS;

  -- Detect a Page Hit
 Page_Hit: PROCESS (Address, PreRow, nReset)
  BEGIN
    IF (nReset = '0') THEN
      nPage_Hit <= '1';
      ELSIF PreRow(17 DOWNTO 11) = Address(31 DOWNTO 25) AND PreRow(10 DOWNTO 0) = Address(23 DOWNTO 13) THEN
        nPage_Hit <= '0';
      ELSE
        nPage_Hit <= '1';
      END IF;
  END PROCESS;

  -- DRAM Select
  nCS_DRAM <= '0' WHEN (Address(31) = '0' AND Address(30) = '0' AND Address(29) = '0' AND nAS = '0' AND nCS_ROM = '1' AND Func = "01") ELSE
              '0' WHEN (Address(31) = '0' AND Address(30) = '0' AND Address(29) = '0' AND nAS = '0' AND nCS_ROM = '1' AND Func = "10") ELSE
              '1';

  -- Bank Selection
  nBank <= "11111110" WHEN Address(28) = '0' AND Address(27) = '0' AND Address(26) = '0' AND nCS_DRAM = '0' ELSE
           "11111101" WHEN Address(28) = '0' AND Address(27) = '0' AND Address(26) = '1' AND nCS_DRAM = '0' ELSE
           "11111011" WHEN Address(28) = '0' AND Address(27) = '1' AND Address(26) = '0' AND nCS_DRAM = '0' ELSE
           "11110111" WHEN Address(28) = '0' AND Address(27) = '1' AND Address(26) = '1' AND nCS_DRAM = '0' ELSE
           "11101111" WHEN Address(28) = '1' AND Address(27) = '0' AND Address(26) = '0' AND nCS_DRAM = '0' ELSE
           "11011111" WHEN Address(28) = '1' AND Address(27) = '0' AND Address(26) = '1' AND nCS_DRAM = '0' ELSE
           "10111111" WHEN Address(28) = '1' AND Address(27) = '1' AND Address(26) = '0' AND nCS_DRAM = '0' ELSE
           "01111111" WHEN Address(28) = '1' AND Address(27) = '1' AND Address(26) = '1' AND nCS_DRAM = '0' ELSE
           "11111111";

  -- Byte Selection
  nByte <= "0111" WHEN nSIZ1 = '0' AND nSIZ0 = '1' AND Address(1) = '0' AND Address(0) = '0' AND nCS_DRAM = '0' ELSE
           "1011" WHEN nSIZ1 = '0' AND nSIZ0 = '1' AND Address(1) = '0' AND Address(0) = '1' AND nCS_DRAM = '0' ELSE
           "1101" WHEN nSIZ1 = '0' AND nSIZ0 = '1' AND Address(1) = '1' AND Address(0) = '0' AND nCS_DRAM = '0' ELSE
           "1110" WHEN nSIZ1 = '0' AND nSIZ0 = '1' AND Address(1) = '1' AND Address(0) = '1' AND nCS_DRAM = '0' ELSE
           "0011" WHEN nSIZ1 = '1' AND nSIZ0 = '0' AND Address(1) = '0' AND Address(0) = '0' AND nCS_DRAM = '0' ELSE
           "1001" WHEN nSIZ1 = '1' AND nSIZ0 = '0' AND Address(1) = '0' AND Address(0) = '1' AND nCS_DRAM = '0' ELSE
           "1100" WHEN nSIZ1 = '1' AND nSIZ0 = '0' AND Address(1) = '1' AND Address(0) = '0' AND nCS_DRAM = '0' ELSE
           "1110" WHEN nSIZ1 = '1' AND nSIZ0 = '0' AND Address(1) = '1' AND Address(0) = '1' AND nCS_DRAM = '0' ELSE
           "0001" WHEN nSIZ1 = '1' AND nSIZ0 = '1' AND Address(1) = '0' AND Address(0) = '0' AND nCS_DRAM = '0' ELSE
           "1000" WHEN nSIZ1 = '1' AND nSIZ0 = '1' AND Address(1) = '0' AND Address(0) = '1' AND nCS_DRAM = '0' ELSE
           "1100" WHEN nSIZ1 = '1' AND nSIZ0 = '1' AND Address(1) = '1' AND Address(0) = '0' AND nCS_DRAM = '0' ELSE
           "1110" WHEN nSIZ1 = '1' AND nSIZ0 = '1' AND Address(1) = '1' AND Address(0) = '1' AND nCS_DRAM = '0' ELSE
           "0000" WHEN nSIZ1 = '0' AND nSIZ0 = '0' AND Address(1) = '0' AND Address(0) = '0' AND nCS_DRAM = '0' ELSE
           "1000" WHEN nSIZ1 = '0' AND nSIZ0 = '0' AND Address(1) = '0' AND Address(0) = '1' AND nCS_DRAM = '0' ELSE
           "1100" WHEN nSIZ1 = '0' AND nSIZ0 = '0' AND Address(1) = '1' AND Address(0) = '0' AND nCS_DRAM = '0' ELSE
           "1110" WHEN nSIZ1 = '0' AND nSIZ0 = '0' AND Address(1) = '1' AND Address(0) = '1' AND nCS_DRAM = '0' ELSE
           "1111";

END Behavioral;