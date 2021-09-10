----------------------------------------------------------------------------------------------------
--
-- FileName:    IACK.vht
-- Description: Interrupt Acknowledge Test Bench.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY IntAcknowledge_TB IS
END IntAcknowledge_TB;

ARCHITECTURE Behavior OF IntAcknowledge_TB IS

  -- Component Declaration for the IntAcknowledge
  COMPONENT IntAcknowledge
    PORT (
      nReset : IN STD_LOGIC;                                                    -- Reset
      nAS : IN STD_LOGIC;                                                       -- Address Strobe
      Function_In : IN STD_LOGIC_VECTOR (2 DOWNTO 0);                           -- System Function
      Address_In : IN STD_LOGIC_VECTOR (23 DOWNTO 0);                           -- Address Bus
      IRQ_ATA : IN STD_LOGIC;                                                   -- ATA IRQ
      IRQ_K : IN STD_LOGIC;                                                     -- Keyboard IRQ
      IRQ_M : IN STD_LOGIC;                                                     -- Mouse IRQ
      Data_Out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);                             -- Data Out
      nDSACK0 : OUT  STD_LOGIC;                                                 -- Data Transfer Acknowledge 0
      nIRQ4 : OUT STD_LOGIC;                                                    -- IRQ4
      nIRQ6 : OUT  STD_LOGIC;                                                   -- IRQ6
      nIACK_DUART : OUT  STD_LOGIC;                                             -- DUART IACK
      nIACK_OUT : OUT  STD_LOGIC                                                -- Expansion IACK
    );
  END COMPONENT;

  -- Inputs
  SIGNAL nReset : STD_LOGIC := '0';
  SIGNAL nAS : STD_LOGIC := '1';
  SIGNAL Function_In : STD_LOGIC_VECTOR (2 DOWNTO 0) := "111";
  SIGNAL Address_In : STD_LOGIC_VECTOR (23 DOWNTO 0) := X"000000";
  SIGNAL IRQ_ATA : STD_LOGIC := '0';
  SIGNAL IRQ_K : STD_LOGIC := '0';
  SIGNAL IRQ_M : STD_LOGIC := '0';

  -- Outputs
  SIGNAL Data_Out : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL nDSACK0 : STD_LOGIC;
  SIGNAL nIRQ4 : STD_LOGIC;
  SIGNAL nIRQ6 : STD_LOGIC;
  SIGNAL nIACK_DUART : STD_LOGIC;
  SIGNAL nIACK_OUT : STD_LOGIC;

BEGIN

  -- Instantiate the IntAcknowledge
  UUT : IntAcknowledge PORT MAP (
    nReset => nReset,
    nAS => nAS,
    Function_In => Function_In,
    Address_In => Address_In,
    IRQ_ATA => IRQ_ATA,
    IRQ_K => IRQ_K,
    IRQ_M => IRQ_M,
    Data_Out => Data_Out,
    nDSACK0 => nDSACK0,
    nIRQ4 => nIRQ4,
    nIRQ6 => nIRQ6,
    nIACK_DUART => nIACK_DUART,
    nIACK_OUT => nIACK_OUT
  );

  -- Stimulus Process Definition
  Stimulus_Process: PROCESS
  BEGIN
    -- Hold Reset
    WAIT FOR 50 NS;
    nReset <= '1';

    -- Test Interrupt 1 Acknowledge.
    WAIT FOR 50 NS;
    Function_In <= "111";
    Address_In <= X"000001";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    Function_In <= "000";
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Test Interrupt 2 Network Acknowledge.
    WAIT FOR 50 NS;
    Function_In <= "111";
    Address_In <= X"000002";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    WAIT FOR 20 NS;
    nAS <= '1';
    Function_In <= "000";
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Test Interrupt 3 Acknowledge.
    WAIT FOR 50 NS;
    Function_In <= "111";
    Address_In <= X"000003";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    Function_In <= "000";
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Test Interrupt 4 ATA Acknowledge.
    WAIT FOR 50 NS;
    IRQ_ATA <= '1';
    Function_In <= "111";
    Address_In <= X"000004";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    WAIT FOR 20 NS;
    nAS <= '1';
    IRQ_ATA <= '0';
    Function_In <= "000";
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Test Interrupt 5 Acknowledge.
    WAIT FOR 50 NS;
    Function_In <= "111";
    Address_In <= X"000005";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    Function_In <= "000";
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Test Interrupt 6 Keyboard Acknowledge.
    WAIT FOR 50 NS;
    IRQ_K <= '1';
    Function_In <= "111";
    Address_In <= X"000006";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    WAIT FOR 20 NS;
    nAS <= '1';
    IRQ_K <= '0';
    Function_In <= "000";
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Test Interrupt 6 Mouse Acknowledge.
    WAIT FOR 50 NS;
    IRQ_M <= '1';
    Function_In <= "111";
    Address_In <= X"000006";
    nAS <= '0';
    WAIT UNTIL nDSACK0 = '0';
    WAIT FOR 20 NS;
    nAS <= '1';
    IRQ_M <= '0';
    Function_In <= "000";
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    -- Test Interrupt 7 Acknowledge.
    WAIT FOR 50 NS;
    Function_In <= "111";
    Address_In <= X"000007";
    nAS <= '0';
    WAIT FOR 50 NS;
    nAS <= '1';
    Function_In <= "000";
    Address_In <= "ZZZZZZZZZZZZZZZZZZZZZZZZ";

    WAIT;
  END PROCESS;

END Behavior;