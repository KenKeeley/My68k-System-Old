----------------------------------------------------------------------------------------------------
--
-- FileName:    StateMachine.vhd
-- Description: MainBoard DRAM Controller CPLD State Machine.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

LIBRARY work;

ENTITY StateMachine IS
  PORT
  (
    Clk : IN STD_LOGIC;                                                         -- Clock
    nReset : IN STD_LOGIC;                                                      -- Reset
    nWR : IN STD_LOGIC;                                                         -- CPU Read/Write signal
    nCS_DRAM : IN STD_LOGIC;                                                    -- DRAM Chip Select
    nPage_Hit : IN STD_LOGIC;                                                   -- Request is in Same Page
    nBank : IN STD_LOGIC_VECTOR (7 DOWNTO 0);                                   -- DRAM Bank to Address
    nByte : IN STD_LOGIC_VECTOR (3 DOWNTO 0);                                   -- Byte/s Selected
    nPreCharge : OUT STD_LOGIC;                                                 -- Flag to show when in PreCharge
    nDSACK0 : OUT STD_LOGIC;                                                    -- Data size/ack signal 0 to CPU
    nDSACK1 : OUT STD_LOGIC;                                                    -- Data size/ack signal 1 to CPU
    nRAS : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);                                   -- Row Address Select
    nCAS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);                                   -- Column Address Select
    nWE_DRAM : OUT STD_LOGIC                                                    -- DRAM Read/Write signal
  );
END StateMachine;

ARCHITECTURE Behavioral OF StateMachine IS

  -- Asynchronous Signals
  SIGNAL nDSACK0_Async : STD_LOGIC;
  SIGNAL nDSACK1_Async : STD_LOGIC;
  SIGNAL nRAS_Async : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL nCAS_Async : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL nWR_Async : STD_LOGIC;
  SIGNAL RefAck_Async : STD_LOGIC;

  -- Internal Signals
  SIGNAL CurrentState : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL NextState : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL RefReq : STD_LOGIC;                                -- Refresh Request
  SIGNAL RefAck : STD_LOGIC;                                -- Refresh Async
  SIGNAL tc : std_logic;                                    -- Refresh counter terminal count signal
  SIGNAL q : std_logic_vector(8 downto 0);                  -- The refresh counter
  SIGNAL pRAS : STD_LOGIC_VECTOR (7 DOWNTO 0);              -- Page mode RAS signals

  -- State Declarations
  CONSTANT idle   : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  CONSTANT rw1    : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
  CONSTANT rw2    : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
  CONSTANT rw3    : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0011";
  CONSTANT page1  : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
  CONSTANT page2  : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0101";
  CONSTANT page3  : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0110";
  CONSTANT cbr1   : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0111";
  CONSTANT cbr2   : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
  CONSTANT cbr3   : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";
  CONSTANT cbr4   : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1010";
  CONSTANT dummy1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1011";
  CONSTANT dummy2 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1100";
  CONSTANT dummy3 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1101";
  CONSTANT dummy4 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1110";
  CONSTANT prechg : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111";

BEGIN

  ---------------------------------------
  ------ Asynchronous Process -----------
  ---------------------------------------
  Async_Cont: PROCESS (nCS_DRAM, nPage_Hit, RefReq, CurrentState, nBank, nByte, nWR, pRAS)
  BEGIN

    CASE CurrentState IS
      WHEN idle =>
        nPreCharge <= '1';
        nCAS_Async <= "1111";
        nDSACK0_Async <= '1';
        nDSACK1_Async <= '1';
        RefAck_Async <= '0';
        -- Do a refresh cycle
        IF (RefReq = '1') THEN
          NextState <= cbr1;
          nWR_Async <= '1';
          nRAS_Async <= "11111111";
        -- Do a normal read/write cycle
        ELSIF (nCS_DRAM = '0') THEN
          NextState <= rw1;
          nWR_Async <= nWR;
          nRAS_Async <= nBank;
        ELSE
          NextState <= idle;
          nWR_Async <= '1';
          nRAS_Async <= nBank;
        END IF;

      -- DRAM Access Start
      WHEN rw1 =>
        NextState <= rw2;
        nPreCharge <= '1';
        nRAS_Async <= nBank;
        nCAS_Async <= nByte;
        nDSACK0_Async <= '0';
        nDSACK1_Async <= '0';
        RefAck_Async <= '0';
        nWR_Async <= nWR;

      WHEN rw2 =>
        NextState <= rw3;
        nPreCharge <= '1';
        nRAS_Async <= nBank;
        nCAS_Async <= "1111";
        nDSACK0_Async <= '1';
        nDSACK1_Async <= '1';
        RefAck_Async <= '0';
        nWR_Async <= nWR;

      WHEN rw3 =>
        nCAS_Async <= "1111";
        nPreCharge <= '1';
        nDSACK0_Async <= '1';
        nDSACK1_Async <= '1';
        RefAck_Async <= '0';
        -- Goto Page Mode access
        IF (nPage_Hit = '0') THEN
          NextState <= page1;
          nRAS_Async <= pRAS;
          nWR_Async <= nWR;

        ELSE
          NextState <= prechg;
          nRAS_Async <= "11111111";
          nWR_Async <= '1';
        END IF;

      WHEN page1 =>
        nPreCharge <= '1';
        nRAS_Async <= pRAS;
        nDSACK0_Async <= '1';
        nDSACK1_Async <= '1';
        RefAck_Async <= '0';
        nWR_Async <= nWR;
        IF (nCS_DRAM = '0' AND nPage_Hit = '0') THEN
          NextState <= page2;
          nCAS_Async <= nByte;
        ELSIF (nPage_Hit = '1') THEN
          NextState <= prechg;
          nRAS_Async <= "11111111";
          nCAS_Async <= "1111";
        ELSE
          NextState <= page1;
          nCAS_Async <= nByte;
        END IF;

      WHEN page2 =>
        nPreCharge <= '1';
        nRAS_Async <= pRAS;
        nCAS_Async <= "1111";
        nDSACK0_Async <= '0';
        nDSACK1_Async <= '0';
        RefAck_Async <= '0';
        nWR_Async <= nWR;
        NextState <= page3;

      WHEN page3 =>
        nPreCharge <= '1';
        nCAS_Async <= "1111";
        nDSACK0_Async <= '1';
        nDSACK1_Async <= '1';
        RefAck_Async <= '0';
        nWR_Async <= nWR;
        IF (nPage_Hit = '0') THEN
          NextState <= page1;
          nRAS_Async <= pRAS;
        ELSE
          NextState <= prechg;
          nRAS_Async <= "11111111";
        END IF;

      -- cbr(CAS Before RAS Refresh) mode start
      WHEN cbr1 =>
        NextState <= cbr2;
        nPreCharge <= '1';
        nRAS_Async <= "11111111";
        nCAS_Async <= "0000";
        nDSACK0_Async <= '1';
        nDSACK1_Async <= '1';
        RefAck_Async <= '1';
        nWR_Async <= '1';

      WHEN cbr2 =>
        NextState <= cbr3;
        nPreCharge <= '1';
        nRAS_Async <= "00000000";
        nCAS_Async <= "0000";
        nDSACK0_Async <= '1';
        nDSACK1_Async <= '1';
        RefAck_Async <= '0';
        nWR_Async <= '1';

      WHEN cbr3 =>
        NextState <= cbr4;
        nPreCharge <= '1';
        nRAS_Async <= "00000000";
        nCAS_Async <= "1111";
        nDSACK0_Async <= '1';
        nDSACK1_Async <= '1';
        RefAck_Async <= '0';
        nWR_Async <= '1';

      WHEN cbr4 =>
        NextState <= prechg;
        nPreCharge <= '1';
        nRAS_Async <= "11111111";
        nCAS_Async <= "1111";
        nDSACK0_Async <= '1';
        nDSACK1_Async <= '1';
        RefAck_Async <= '0';
        nWR_Async <= '1';

      WHEN prechg =>
        NextState <= idle;
        nPreCharge <= '0';
        nRAS_Async <= "11111111";
        nCAS_Async <= "1111";
        nDSACK0_Async <= '1';
        nDSACK1_Async <= '1';
        RefAck_Async <= '0';
        nWR_Async <= '1';

      WHEN OTHERS =>
        NextState <= idle;
        nPreCharge <= '1';
        nRAS_Async <= "11111111";
        nCAS_Async <= "1111";
        nDSACK0_Async <= '1';
        nDSACK1_Async <= '1';
        RefAck_Async <= '0';
        nWR_Async <= nWR;
    END CASE;
  END PROCESS;

  ---------------------------------------
  ------ Synchronous Process ------------
  ---------------------------------------
  Sync_Cont: PROCESS (Clk, nReset)
  BEGIN
    IF (nReset = '0') THEN
      CurrentState <= IDLE;
      nRAS         <= "11111111";
      nCAS         <= "1111";
      nDSACK0      <= '1';
      nDSACK1      <= '1';
      nWE_DRAM     <= '1';
      RefAck       <= '0';
    ELSIF FALLING_EDGE(Clk) THEN
      CurrentState <= NextState;
      nRAS         <= nRAS_Async;
      nCAS         <= nCAS_Async;
      nDSACK0      <= nDSACK0_Async;
      nDSACK1      <= nDSACK1_Async;
      nWE_DRAM     <= nWR_Async;
      RefAck       <= RefAck_Async;
    END IF;
  END PROCESS;

  ---------------------------------------
  ------ Refresh Counter Process --------
  ---------------------------------------
  rfcnt: PROCESS (Clk, RefAck, nReset)
  BEGIN
    IF (nReset = '0') THEN
      q <= "000000000";
    ELSIF FALLING_EDGE(Clk) THEN
      IF RefAck = '1' THEN
        q <= "000000000";
      ELSE
        q <= q + 1;
      END IF;
    END IF;
  END PROCESS;

  -- 186hex = 110000110 binary = 390 decimal
  -- assuming 25 MHz clock (40ns clock period)
  -- 40ns (tCYC) x 390 = 15.6us is the refresh request rate.
  tc <=   '1' WHEN q = "110000110" ELSE '0';

  ---------------------------------------
  ------ Refresh Request Process --------
  ---------------------------------------
  rreq: PROCESS (Clk, tc, RefAck, nReset)
  BEGIN
    IF (nReset = '0') THEN
      RefReq <= '0';
    ELSIF FALLING_EDGE(Clk) THEN
      IF RefAck = '1' THEN
        RefReq <= '0';
      ELSIF tc = '1' THEN
        RefReq <= '1';
      END IF;
    END IF;
  END PROCESS;

  -- The PRASx signals are used to maintain the RASOx outputs
  -- between the actual CPU accesses of a page mode access.
  pras_ctl: PROCESS (Clk, nReset)
    BEGIN
      IF (nReset = '0') THEN
        pRAS <= "11111111";
      ELSIF FALLING_EDGE(Clk) THEN
        IF ((CurrentState = rw1) or (CurrentState = page2)) then
          pRAS <= nBank;
        END IF;
      END IF;
    END PROCESS;

END Behavioral;