----------------------------------------------------------------------------------------------------
--
-- FileName:    Clock_Div_2.vhd
-- Description: Clock Divide by 2.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;

ENTITY Clock_Div_2 IS
  PORT
  (
    nReset : IN STD_LOGIC;                                                      -- Reset
    ClkIn : IN STD_LOGIC;                                                       -- Incoming Clock
    ClkOut : OUT  STD_LOGIC                                                     -- Outgoing Clock
  );
END Clock_Div_2;

ARCHITECTURE Behavioral OF Clock_Div_2 IS
  SIGNAL Clk_Buffer : STD_LOGIC;

BEGIN

PROCESS(ClkIn, nReset)
  BEGIN
    IF (nReset = '0') THEN
      Clk_Buffer <= '0';
    ELSIF RISING_EDGE(ClkIn) THEN
      Clk_Buffer <= NOT Clk_Buffer;
    END IF;
  END PROCESS;

  ClkOut <= Clk_Buffer;

END Behavioral;