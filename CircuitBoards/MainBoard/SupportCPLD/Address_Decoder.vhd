----------------------------------------------------------------------------------------------------
--
-- FileName:    Address_Decoder.vhd
-- Description: Address Decoder Logic.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;

ENTITY Address_Decoder IS
  PORT
  (
    nReset : IN STD_LOGIC;                                                      -- Reset
    nAS : IN STD_LOGIC;                                                         -- Address Strobe
    nHigh_Address : IN STD_LOGIC;                                               -- Upper Address Range
    Function_In : IN STD_LOGIC_VECTOR (2 DOWNTO 0);                             -- System Function
    Address_In : IN STD_LOGIC_VECTOR (23 DOWNTO 0);                             -- Address Bus
    nCS_FPU : OUT STD_LOGIC;                                                    -- FPU Chip Select
    nCS_ATA : OUT STD_LOGIC;                                                    -- ATA Buffer Chip Select
    nCS_ATA0 : OUT STD_LOGIC;                                                   -- ATA Chip Select 0
    nCS_ATA1 : OUT STD_LOGIC;                                                   -- ATA Chip Select 1
    nCS_RTC : OUT STD_LOGIC;                                                    -- RTC Chip Select
    AS_RTC : OUT STD_LOGIC;                                                     -- RTC AS Select
    DS_RTC : OUT STD_LOGIC;                                                     -- RTC DS Select
    nCS_PS2 : OUT STD_LOGIC;                                                    -- PS2 Chip Select
    nCS_ID1 : OUT STD_LOGIC;                                                    -- Hardware ID 1
    nCS_ID2 : OUT STD_LOGIC;                                                    -- Hardware ID 2
    nPS_OFF : OUT STD_LOGIC;                                                    -- Power Off
    nCS_DUART : OUT STD_LOGIC;                                                  -- DUART Chip Select
    nCS_NET : OUT STD_LOGIC;                                                    -- Network Chip Select
    nCS_SRAM : OUT STD_LOGIC;                                                   -- SRAM Chip Select
    nCS_ROM : OUT  STD_LOGIC                                                    -- ROM Chip Select
  );
END Address_Decoder;

ARCHITECTURE Behavioral OF Address_Decoder IS

  SIGNAL nPhantom : STD_LOGIC;
  SIGNAL Counter : UNSIGNED(2 DOWNTO 0);

BEGIN

PROCESS(nReset, nAS)
  BEGIN
    IF (nReset = '0') THEN
      nPhantom <= '0';
      Counter <= "000";
    ELSIF RISING_EDGE(nAS) THEN
      IF Counter < 7 THEN
        nPhantom <= '0';
        Counter <= Counter + 1;
      ELSE
        nPhantom <= '1';
      END IF;
    END IF;
  END PROCESS;

PROCESS(nReset, nAS, nPhantom)
  BEGIN
    IF (nReset = '0' OR nAS = '1') THEN
      nCS_FPU <= '1';
      nCS_ATA <= '1';
      nCS_ATA0 <= '1';
      nCS_ATA1 <= '1';
      nCS_RTC <= '1';
      AS_RTC <= '0';
      DS_RTC <= '0';
      nCS_PS2 <= '1';
      nCS_ID1<= '1';
      nCS_ID2 <= '1';
      nPS_OFF <= '1';
      nCS_DUART <= '1';
      nCS_NET <= '1';
      nCS_SRAM <= '1';
      nCS_ROM <= '1';

    ELSIF FALLING_EDGE(nAS) THEN

      IF (Function_In = "111" AND Address_In = X"022000") THEN
        nCS_FPU <= '0';
      ELSIF ( (Function_In(1 DOWNTO 0) = "01" OR Function_In(1 DOWNTO 0) = "10" ) AND nHigh_Address = '1' AND nPhantom = '0' AND Address_In < X"000008") THEN
        nCS_ROM <= '0';
      ELSIF ( (Function_In(1 DOWNTO 0) = "01" OR Function_In(1 DOWNTO 0) = "10" ) AND nHigh_Address = '0') THEN

        IF Address_In >= X"FC0000" AND Address_In <= X"FC001F" AND Address_In(0) = '0' THEN
          nCS_ATA <= '0';
          nCS_ATA1 <= '0';
          IF Address_In(4) = '0' THEN
            nCS_ATA0 <= '0';
          END IF;

        ELSIF Address_In >= X"FC0020" AND Address_In <= X"FC002F" AND Address_In(0) = '0' THEN
          nCS_ATA <= '0';
          IF Address_In(4) = '0' THEN
            nCS_ATA0 <= '0';
          END IF;

        ELSIF Address_In = X"FC0030" THEN
          nCS_RTC <= '0';
          AS_RTC <= '1';

        ELSIF Address_In = X"FC0031" THEN
          nCS_RTC <= '0';
          DS_RTC <= '1';

        ELSIF Address_In = X"FC0032" THEN
          nCS_PS2 <= '0';

        ELSIF Address_In = X"FC0033" THEN
          nCS_PS2 <= '0';

        ELSIF Address_In = X"FC0034" THEN
          nCS_ID1 <= '0';

        ELSIF Address_In = X"FC0035" THEN
          nCS_ID2 <= '0';

        ELSIF Address_In = X"FC0038" THEN
          nPS_OFF <= '0';

        ELSIF Address_In >= X"FC0040" AND Address_In <= X"FC004F" THEN
          nCS_DUART <= '0';

        ELSIF Address_In >= X"FC0060" AND Address_In <= X"FC007F" THEN
          nCS_NET <= '0';

        ELSIF Address_In >= X"FD0000" AND Address_In <= X"FD7FFF" THEN
          nCS_SRAM <= '0';

        ELSIF Address_In >= X"FE0000" THEN
          nCS_ROM <= '0';

        END IF;
      ELSE
        nCS_FPU <= '1';
        nCS_ATA <= '1';
        nCS_ATA0 <= '1';
        nCS_ATA1 <= '1';
        nCS_RTC <= '1';
        AS_RTC <= '0';
        DS_RTC <= '0';
        nCS_PS2 <= '1';
        nCS_ID1<= '1';
        nCS_ID2 <= '1';
        nPS_OFF <= '1';
        nCS_DUART <= '1';
        nCS_NET <= '1';
        nCS_SRAM <= '1';
        nCS_ROM <= '1';
      END IF;
    END IF;
  END PROCESS;

END Behavioral;