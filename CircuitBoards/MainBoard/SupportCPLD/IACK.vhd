----------------------------------------------------------------------------------------------------
--
-- FileName:    IACK.vhd
-- Description: Interrupt Acknowledge.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;

ENTITY IntAcknowledge IS
  PORT
  (
    nReset : IN STD_LOGIC;                                                      -- Reset
    nAS : IN STD_LOGIC;                                                         -- Address Strobe
    Function_In : IN STD_LOGIC_VECTOR (2 DOWNTO 0);                             -- System Function
    Address_In : IN STD_LOGIC_VECTOR (23 DOWNTO 0);                             -- Address Bus
    IRQ_ATA : IN STD_LOGIC;                                                     -- ATA IRQ
    IRQ_K : IN STD_LOGIC;                                                       -- Keyboard IRQ
    IRQ_M : IN STD_LOGIC;                                                       -- Mouse IRQ
    Data_Out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);                               -- Data Out
    nDSACK0 : OUT  STD_LOGIC;                                                   -- Data Transfer Acknowledge 0
    nIRQ4 : OUT STD_LOGIC;                                                      -- IRQ4
    nIRQ6 : OUT  STD_LOGIC;                                                     -- IRQ6
    nIACK_DUART : OUT  STD_LOGIC;                                               -- DUART IACK
    nIACK_OUT : OUT  STD_LOGIC                                                  -- Expansion IACK
  );
END IntAcknowledge;

ARCHITECTURE Behavioral OF IntAcknowledge IS

BEGIN

PROCESS(nReset, nAS)
  BEGIN
    IF (nReset = '0' OR nAS = '1') THEN
      Data_Out <= "ZZZZZZZZ";
      nDSACK0 <= 'Z';
      nIACK_DUART <= '1';
      nIACK_OUT <= '1';

    ELSIF FALLING_EDGE(nAS) THEN

      IF (Function_In = "111") THEN

        -- Network Interrupt Acknowledge Vector 170.
        IF Address_In = X"000002" THEN
          Data_Out <= X"AA";
          nDSACK0 <= '0';

        -- ATA Interrupt Acknowledge Vector 187.
        ELSIF Address_In = X"000004" AND IRQ_ATA = '1' THEN
          Data_Out <= X"BB";
          nDSACK0 <= '0';

        -- DUART Interrupt Acknowledge.
        ELSIF Address_In = X"000005" THEN
          nIACK_DUART <= '0';

        -- Keyboard Interrupt Acknowledge Vector 204.
        ELSIF Address_In = X"000006" AND IRQ_K = '1' THEN
          Data_Out <= X"CC";
          nDSACK0 <= '0';

        -- Mouse Interrupt Acknowledge Vector 221.
        ELSIF Address_In = X"000006" AND IRQ_M = '1' THEN
          Data_Out <= X"DD";
          nDSACK0 <= '0';

        -- expansion Interrupt Acknowledge.
        ELSIF Address_In < X"000008" THEN
          nIACK_OUT <= '0';

        END IF;
      END IF;
    END IF;
END PROCESS;

  -- Generate Interrupt 4 request.
  nIRQ4 <= NOT IRQ_ATA;

  -- Generate Interrupt 6 requests.
  nIRQ6 <= NOT (IRQ_K OR IRQ_M);

END Behavioral;