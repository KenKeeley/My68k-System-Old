----------------------------------------------------------------------------------------------------
--
-- FileName:    Support.vht
-- Description: MainBoard Support CPLD Top Level Test Bench.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY Support_TB IS
END Support_TB;

ARCHITECTURE Behavior OF Support_TB IS

  -- Component Declaration for the Support
  COMPONENT Support
    PORT (
      nReset : IN STD_LOGIC;                                                    -- Reset
      Clk : IN STD_LOGIC;                                                       -- Clock
      nAS : IN STD_LOGIC;                                                       -- Address Strobe
      nWR : IN STD_LOGIC;                                                       -- Write Strobe
      nHigh_Address : IN STD_LOGIC;                                             -- Upper Address Range
      Function_In : IN STD_LOGIC_VECTOR (2 DOWNTO 0);                           -- System Function
      Address_In : IN STD_LOGIC_VECTOR (23 DOWNTO 0);                           -- Address Bus
      DTACK_ATA : IN STD_LOGIC;                                                 -- ATA Data Acknowledge
      DTACK_NET : IN STD_LOGIC;                                                 -- Network Data Acknowledge

      CPU_Clock : OUT  STD_LOGIC;                                               -- CPU Clock
      PS2_Clock : OUT  STD_LOGIC;                                               -- PS2 Clock
      nCS_FPU : OUT STD_LOGIC;                                                  -- FPU Chip Select
      nCS_ATA : OUT STD_LOGIC;                                                  -- ATA Buffer Chip Select
      nCS_ATA0 : OUT STD_LOGIC;                                                 -- ATA Chip Select 0
      nCS_ATA1 : OUT STD_LOGIC;                                                 -- ATA Chip Select 1
      nCS_RTC : OUT STD_LOGIC;                                                  -- RTC Chip Select
      AS_RTC : BUFFER STD_LOGIC;                                                -- RTC AS Select
      DS_RTC : OUT STD_LOGIC;                                                   -- RTC DS Select
      nCS_PS2 : BUFFER STD_LOGIC;                                               -- PS2 Chip Select
      nCS_ID1 : OUT STD_LOGIC;                                                  -- Hardware ID 1
      nCS_ID2 : OUT STD_LOGIC;                                                  -- Hardware ID 2
      nPS_OFF : BUFFER STD_LOGIC;                                               -- Power Off
      nCS_DUART : OUT STD_LOGIC;                                                -- DUART Chip Select
      nCS_NET : OUT STD_LOGIC;                                                  -- Network Chip Select
      nCS_SRAM : BUFFER STD_LOGIC;                                              -- SRAM Chip Select
      nCS_ROM : BUFFER  STD_LOGIC;                                              -- ROM Chip Select
      nDSACK0 : OUT STD_LOGIC;                                                  -- Data Transfer Acknowledge 0
      nDSACK1 : OUT  STD_LOGIC;                                                 -- Data Transfer Acknowledge 1
      nRD : OUT STD_LOGIC;                                                      -- Read Strobe
      nBERR : OUT  STD_LOGIC                                                    -- Bus Error
    );
  END COMPONENT;

  -- Inputs
  SIGNAL nReset : STD_LOGIC := '0';
  SIGNAL Clk : STD_LOGIC := '0';
  SIGNAL nAS : STD_LOGIC := '1';
  SIGNAL nWR : STD_LOGIC := '1';
  SIGNAL nHigh_Address : STD_LOGIC := '1';
  SIGNAL Function_In : STD_LOGIC_VECTOR (2 DOWNTO 0) := "001";
  SIGNAL Address_In : STD_LOGIC_VECTOR (23 DOWNTO 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZ"; --X"000000";
  SIGNAL DTACK_ATA : STD_LOGIC := '0';
  SIGNAL DTACK_NET : STD_LOGIC := '0';

  -- Outputs
  SIGNAL CPU_Clock : STD_LOGIC;
  SIGNAL PS2_Clock : STD_LOGIC;
  SIGNAL nCS_FPU : STD_LOGIC;
  SIGNAL nCS_ATA : STD_LOGIC;
  SIGNAL nCS_ATA0 : STD_LOGIC;
  SIGNAL nCS_ATA1 : STD_LOGIC;
  SIGNAL nCS_RTC : STD_LOGIC;
  SIGNAL AS_RTC : STD_LOGIC;
  SIGNAL DS_RTC : STD_LOGIC;
  SIGNAL nCS_PS2 : STD_LOGIC;
  SIGNAL nCS_ID1 : STD_LOGIC;
  SIGNAL nCS_ID2 : STD_LOGIC;
  SIGNAL nPS_OFF : STD_LOGIC;
  SIGNAL nCS_DUART : STD_LOGIC;
  SIGNAL nCS_NET : STD_LOGIC;
  SIGNAL nCS_SRAM : STD_LOGIC;
  SIGNAL nCS_ROM : STD_LOGIC;
  SIGNAL nDSACK0 : STD_LOGIC;
  SIGNAL nDSACK1 : STD_LOGIC;
  SIGNAL nRD : STD_LOGIC;
  SIGNAL nBERR : STD_LOGIC;

  -- Clock Period Definition
  CONSTANT clk_period : TIME := 20 NS;

BEGIN

  -- Instantiate the Support
  UUT : Support PORT MAP (
    nReset => nReset,
    Clk => Clk,
    nAS => nAS,
    nWR => nWR,
    nHigh_Address => nHigh_Address,
    Function_In => Function_In,
    Address_In => Address_In,
    DTACK_ATA => DTACK_ATA,
    DTACK_NET => DTACK_NET,
    CPU_Clock => CPU_Clock,
    PS2_Clock => PS2_Clock,
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
    nCS_ROM => nCS_ROM,
    nDSACK0 => nDSACK0,
    nDSACK1 => nDSACK1,
    nRD => nRD,
    nBERR => nBERR
  );

  -- Clock Process Definition
  Clock_Process: PROCESS
  BEGIN
    Clk <= '0';
    WAIT FOR clk_period/2;
    Clk <= '1';
    WAIT FOR clk_period/2;
  END PROCESS;

  -- Stimulus Process Definition
  Stimulus_Process: PROCESS
  BEGIN
    -- Hold Reset
    WAIT FOR 50 NS;
    nReset <= '1';

    -- Read 1st byte from ROM after restart.
    WAIT FOR 50 NS;
    Address_In <= X"000000";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Read 2nd byte from ROM after restart.
    WAIT FOR 50 NS;
    Address_In <= X"000001";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Read 3rd byte from ROM after restart.
    WAIT FOR 50 NS;
    Address_In <= X"000002";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Read 4th byte from ROM after restart.
    WAIT FOR 50 NS;
    Address_In <= X"000003";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Read 5th byte from ROM after restart.
    WAIT FOR 50 NS;
    Address_In <= X"000004";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Read 6th byte from ROM after restart.
    WAIT FOR 50 NS;
    Address_In <= X"000005";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Read 7th byte from ROM after restart.
    WAIT FOR 50 NS;
    Address_In <= X"000006";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Read 8th byte from ROM after restart.
    WAIT FOR 50 NS;
    Address_In <= X"000007";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- FPU access.
    WAIT FOR 50 NS;
    Function_In <= "111";
    Address_In <= X"022000";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    Function_In <= "001";
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 1st Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0000";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 2nd Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0002";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 3rd Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0004";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 4th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0006";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 5th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0008";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 6th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC000A";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 7th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC000C";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 8th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC000E";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 9th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0010";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 10th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0012";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 11th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0014";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 12th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0016";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 13th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0018";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 14th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC001A";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 15th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC001C";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 16th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC001E";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 17th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0020";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 18th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0022";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 19th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0024";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 20th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0026";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 21st Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0028";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 22nd Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC002A";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 23rd Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC002C";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 24th Word of ATA address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC002E";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 1st Byte of RTC address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0030";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 2nd Byte of RTC address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0031";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 1st Byte of PS/2 address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0032";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 2nd Byte of PS/2 address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0033";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 1st Byte of Hardware ID address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0034";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 2nd Byte of Hardware ID address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0035";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 3rd Byte of Hardware ID address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0036";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 4th Byte of Hardware ID address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0037";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- PS Off address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0038";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 1st Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0040";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 2nd Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0041";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 3rd Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0042";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 4th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0043";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 5th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0044";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 6th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0045";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 7th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0046";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 8th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0047";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 9th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0048";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 10th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0049";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 11th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC004A";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 12th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC004B";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 13th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC004C";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 14th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC004D";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 15th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC004E";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 16th Byte of DUART address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC004F";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 1st Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0060";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 2nd Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0062";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 3rd Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0064";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 4th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0066";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 5th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0068";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 6th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC006A";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 7th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC006C";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 8th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC006E";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 9th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0070";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 10th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0072";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 11th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0074";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 12th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0076";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 13th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC0078";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 14th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC007A";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 15th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC007C";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- 16th Word of Network address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FC007E";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Write 1st byte from RAM address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FD0000";
    nWR <= '0';
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    nWR <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Read last byte from RAM address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FD7FFF";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Write 1st byte from ROM address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FE0000";
    nWR <= '0';
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    nWR <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Read last byte from ROM address space.
    WAIT FOR 50 NS;
    nHigh_Address <= '0';
    Address_In <= X"FFFFFF";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    nAS <= '1';
    nHigh_Address <= '1';
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- nBERR test.
    WAIT FOR 50 NS;
    nAS <= '0';

    WAIT;
  END PROCESS;

END Behavior;