----------------------------------------------------------------------------------------------------
--
-- FileName:    MUX.vhd
-- Description: MainBoard DRAM Controller CPLD Multiplexer.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;

ENTITY Multiplexer IS
  PORT
  (
    Address : IN STD_LOGIC_VECTOR (23 DOWNTO 0);                                -- Address Bus
    nRAS : IN STD_LOGIC_VECTOR (7 DOWNTO 0);                                    -- Row Address Select
    MA : OUT STD_LOGIC_VECTOR (11 DOWNTO 0)                                     -- Multiplexed Address Bus
  );
END Multiplexer;

ARCHITECTURE Behavioral OF Multiplexer IS

SIGNAL MUX : std_logic;               -- The logical OR of the RAS signals
SIGNAL MXS : std_logic;               -- delayed MUX

BEGIN

  -- Asserted when any RAS is asserted
  MUX <= '0' WHEN nRAS = "11111111" ELSE '1';

  -- This is just a delayed version of MUX.
  MXS <= MUX;

  -- column address during RAS active
  MA(11) <= Address(22) WHEN MXS = '1' ELSE Address(23);
  MA(10 DOWNTO 0) <= Address(10 DOWNTO 0) WHEN MXS = '1' ELSE Address(21 DOWNTO 11);

END Behavioral;