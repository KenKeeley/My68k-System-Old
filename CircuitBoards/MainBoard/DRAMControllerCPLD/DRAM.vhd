----------------------------------------------------------------------------------------------------
--
-- FileName:    DRAM.vhd
-- Description: MainBoard DRAM Controller CPLD Top Level.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;

ENTITY DRAMController IS
  PORT
  (
    Clk : IN STD_LOGIC;                                                         -- Clock
    nReset : IN STD_LOGIC;                                                      -- Reset
    Address : IN STD_LOGIC_VECTOR (31 DOWNTO 0);                                -- Address Bus
    nAS : IN STD_LOGIC;                                                         -- CPU Address signal
    nSIZ0 : IN STD_LOGIC;                                                       -- CPU SIZ 0 signal
    nSIZ1 : IN STD_LOGIC;                                                       -- CPU SIZ 1 signal
    Func : IN STD_LOGIC_VECTOR (1 DOWNTO 0);                                    -- CPU Function Signals
    nWR : IN STD_LOGIC;                                                         -- CPU Read/Write signal
    nCS_ROM : IN  STD_LOGIC;                                                    -- ROM Chip Select
    nDSACK0_OUT : OUT STD_LOGIC;                                                -- CPU DSACK 0 signal
    nDSACK1_OUT : OUT STD_LOGIC;                                                -- CPU DSACK 1 signal
    MA : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);                                    -- Multiplexed Address Bus
    nRAS_DRAM : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);                              -- Row Address Select
    nCAS_DRAM : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);                              -- Column Address Select
    nWE_DRAM : OUT STD_LOGIC                                                    -- DRAM Read/Write signal
  );
END DRAMController;

ARCHITECTURE Behavioral OF DRAMController IS

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

  -- Component Declaration for the Multiplexer
  COMPONENT Multiplexer
    PORT (
      Address : IN STD_LOGIC_VECTOR (23 DOWNTO 0);                              -- Address Bus
      nRAS : IN STD_LOGIC_VECTOR (7 DOWNTO 0);                                  -- Row Address Select
      MA : OUT STD_LOGIC_VECTOR (11 DOWNTO 0)                                   -- Multiplexed Address Bus
    );
  END COMPONENT;

  -- Define internal signals.
  SIGNAL nCS_DRAM : STD_LOGIC;
  SIGNAL nPage_Hit : STD_LOGIC;
  SIGNAL nPreCharge : STD_LOGIC;
  SIGNAL nBank : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL nByte : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL nRAS : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL nDSACK0 : STD_LOGIC;
  SIGNAL nDSACK1 : STD_LOGIC;

BEGIN

  -- Instantiate the State Machine
  State_Machine : StateMachine PORT MAP (
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
    nCAS => nCAS_DRAM,
    nWE_DRAM => nWE_DRAM
  );

  -- Instantiate the Decoder
  Address_Decoder : Decoder PORT MAP (
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

  -- Instantiate the Multiplexer
  Address_Multiplexer : Multiplexer PORT MAP (
    Address(23 DOWNTO 0) => Address(25 DOWNTO 2),
    nRAS => nRAS,
    MA => MA
  );

  -- Connect signals that also tie to external ports to those ports
  nRAS_DRAM <= nRAS;
  nDSACK0_OUT <= '0' WHEN nDSACK0 = '0' ELSE 'Z';
  nDSACK1_OUT <= '0' WHEN nDSACK1 = '0' ELSE 'Z';

END Behavioral;