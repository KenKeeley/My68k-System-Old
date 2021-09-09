----------------------------------------------------------------------------------------------------
--
-- FileName:    Support.vhd
-- Description: MainBoard Support CPLD Top Level.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;

ENTITY Support IS
  PORT
  (
    nReset : IN STD_LOGIC;                                                      -- Reset
    Clk : IN STD_LOGIC;                                                         -- Clock
    nAS : IN STD_LOGIC;                                                         -- Address Strobe
    nWR : IN STD_LOGIC;                                                         -- Write Strobe
    nHigh_Address : IN STD_LOGIC;                                               -- Upper Address Range
    Function_In : IN STD_LOGIC_VECTOR (2 DOWNTO 0);                             -- System Function
    Address_In : IN STD_LOGIC_VECTOR (23 DOWNTO 0);                             -- Address Bus
    DTACK_ATA : IN STD_LOGIC;                                                   -- ATA Data Acknowledge
    DTACK_NET : IN STD_LOGIC;                                                   -- Network Data Acknowledge

    CPU_Clock : OUT  STD_LOGIC;                                                 -- CPU Clock
    PS2_Clock : OUT  STD_LOGIC;                                                 -- PS2 Clock
    nCS_FPU : OUT STD_LOGIC;                                                    -- FPU Chip Select
    nCS_ATA : OUT STD_LOGIC;                                                    -- ATA Buffer Chip Select
    nCS_ATA0 : OUT STD_LOGIC;                                                   -- ATA Chip Select 0
    nCS_ATA1 : OUT STD_LOGIC;                                                   -- ATA Chip Select 1
    nCS_RTC : BUFFER STD_LOGIC;                                                 -- RTC Chip Select
    AS_RTC : OUT STD_LOGIC;                                                     -- RTC AS Select
    DS_RTC : OUT STD_LOGIC;                                                     -- RTC DS Select
    nCS_PS2 : BUFFER STD_LOGIC;                                                 -- PS2 Chip Select
    nCS_ID1 : OUT STD_LOGIC;                                                    -- Hardware ID 1
    nCS_ID2 : OUT STD_LOGIC;                                                    -- Hardware ID 2
    nPS_OFF : BUFFER STD_LOGIC;                                                 -- Power Off
    nCS_DUART : OUT STD_LOGIC;                                                  -- DUART Chip Select
    nCS_NET : OUT STD_LOGIC;                                                    -- Network Chip Select
    nCS_SRAM : BUFFER STD_LOGIC;                                                -- SRAM Chip Select
    nCS_ROM : BUFFER  STD_LOGIC;                                                -- ROM Chip Select
    nDSACK0 : OUT  STD_LOGIC;                                                   -- Data Transfer Acknowledge 0
    nDSACK1 : OUT  STD_LOGIC;                                                   -- Data Transfer Acknowledge 1
    nRD : OUT STD_LOGIC;                                                        -- Read Strobe
    nBERR : OUT  STD_LOGIC                                                      -- Bus Error
  );
END Support;

ARCHITECTURE Behavioral OF Support IS

  -- Component Declaration for the 'Divide by 5' block.
  COMPONENT Clock_Div_5
    PORT(nReset : IN STD_LOGIC;
      ClkIn : IN STD_LOGIC;
      ClkOut : OUT STD_LOGIC
    );
  END COMPONENT;

  -- Component Declaration for the 'Divide by 2' block.
  COMPONENT Clock_Div_2
    PORT(nReset : IN STD_LOGIC;
      ClkIn : IN STD_LOGIC;
      ClkOut : OUT STD_LOGIC
    );
  END COMPONENT;

  -- Component Declaration for the Address_Decoder
  COMPONENT Address_Decoder
    PORT (
      nReset : IN STD_LOGIC;
      nAS : IN STD_LOGIC;
      nHigh_Address : IN STD_LOGIC;
      Function_In : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      Address_In : IN STD_LOGIC_VECTOR (23 DOWNTO 0);

      nCS_FPU : OUT STD_LOGIC;
      nCS_ATA : OUT STD_LOGIC;
      nCS_ATA0 : OUT STD_LOGIC;
      nCS_ATA1 : OUT STD_LOGIC;
      nCS_RTC : BUFFER STD_LOGIC;
      AS_RTC : OUT STD_LOGIC;
      DS_RTC : OUT STD_LOGIC;
      nCS_PS2 : BUFFER STD_LOGIC;
      nCS_ID1 : OUT STD_LOGIC;
      nCS_ID2 : OUT STD_LOGIC;
      nPS_OFF : BUFFER STD_LOGIC;
      nCS_DUART : OUT STD_LOGIC;
      nCS_NET : OUT STD_LOGIC;
      nCS_SRAM : BUFFER STD_LOGIC;
      nCS_ROM : BUFFER  STD_LOGIC
    );
  END COMPONENT;

  -- Component Declaration for the DTACK
  COMPONENT DTACK
    PORT (
      nReset : IN STD_LOGIC;
      ClkIn : IN STD_LOGIC;
      nAS : IN STD_LOGIC;
      nCS_RTC : IN STD_LOGIC;
      nCS_PS2 : IN STD_LOGIC;
      nPS_OFF : IN STD_LOGIC;
      nCS_SRAM : IN STD_LOGIC;
      nCS_ROM : IN STD_LOGIC;
      nDSACK0 : OUT STD_LOGIC;
      nBERR : OUT  STD_LOGIC
    );
  END COMPONENT;

BEGIN

  -- Instantiate the CPU Clock
  Clock_CPU : Clock_Div_2 PORT MAP(
    nReset => nReset,
    ClkIn => Clk,
    ClkOut => CPU_Clock
  );

  -- Instantiate the PS2 Clock
  Clock_PS2 : Clock_Div_5 PORT MAP(
    nReset => nReset,
    ClkIn => Clk,
    ClkOut => PS2_Clock
  );

  -- Instantiate the Chip Select Decoder
  Chip_Selects : Address_Decoder PORT MAP (
    nReset => nReset,
    nAS => nAS,
    nHigh_Address => nHigh_Address,
    Function_In => Function_In,
    Address_In => Address_In,
    nCS_FPU => nCS_FPU,
    nCS_ATA => nCS_ATA,
    nCS_ATA0 => nCS_ATA0,
    nCS_ATA1 => nCS_ATA1,
    nCS_RTC => nCS_RTC,
    AS_RTC => AS_RTC,
    DS_RTC => DS_RTC,
    nCS_PS2 => nCS_PS2,
    nCS_ID1 => nCS_ID1,
    nCS_ID2 => nCS_ID2,
    nPS_OFF => nPS_OFF,
    nCS_DUART => nCS_DUART,
    nCS_NET => nCS_NET,
    nCS_SRAM => nCS_SRAM,
    nCS_ROM => nCS_ROM
  );

  -- Instantiate the DTACK
  DTACK_Timer : DTACK PORT MAP (
    nReset => nReset,
    ClkIn => Clk,
    nAS => nAS,
    nCS_RTC => nCS_RTC,
    nCS_PS2 => nCS_PS2,
    nPS_OFF => nPS_OFF,
    nCS_SRAM => nCS_SRAM,
    nCS_ROM => nCS_ROM,
    nDSACK0 => nDSACK0,
    nBERR => nBERR
  );

  -- Generate Read Strobe.
  nRD <= NOT nWR;

  -- Generate ATA and Network DTACK.
  nDSACK1 <= NOT ( DTACK_ATA OR DTACK_NET );

END Behavioral;