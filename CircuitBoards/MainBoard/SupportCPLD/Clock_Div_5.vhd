----------------------------------------------------------------------------------------------------
--
-- FileName:    Clock_Div_5.vhd
-- Description: Clock Divide by 5.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;

ENTITY Clock_Div_5 IS
  PORT
  (
    nReset : IN STD_LOGIC;                                                      -- Reset
    ClkIn : IN STD_LOGIC;                                                       -- Incoming Clock
    ClkOut : OUT  STD_LOGIC                                                     -- Outgoing Clock
  );
END Clock_Div_5;

ARCHITECTURE Behavioral OF Clock_Div_5 IS
  SIGNAL Div_1 : STD_LOGIC;
  SIGNAL Div_2 : STD_LOGIC;
  SIGNAL Counter_1 : UNSIGNED(2 DOWNTO 0);
  SIGNAL Counter_2 : UNSIGNED(2 DOWNTO 0);

BEGIN

PROCESS(ClkIn, nReset)
  BEGIN
    IF (nReset = '0') THEN
      Div_1 <= '0';
      Counter_1 <= "000";
    ELSIF RISING_EDGE(ClkIn) THEN
      IF Counter_1 = 5 THEN
        Counter_1 <= "001";
        Div_1 <= '1';
      ELSIF Counter_1 >= 2 THEN
        Div_1 <= '0';
        Counter_1 <= Counter_1 + 1;
      ELSE
        Div_1 <= '1';
        Counter_1 <= Counter_1 + 1;
      END IF;
    END IF;
  END PROCESS;

PROCESS(ClkIn, nReset)
  BEGIN
    IF (nReset = '0') THEN
      Div_2 <= '0';
      Counter_2 <= "000";
    ELSIF FALLING_EDGE(ClkIn) THEN
      IF Counter_2 = 5 THEN
        Counter_2 <= "001";
        Div_2 <= '1';
      ELSIF Counter_2 >= 2 THEN
        Div_2 <= '0';
        Counter_2 <= Counter_2 + 1;
      ELSE
        Div_2 <= '1';
        Counter_2 <= Counter_2 + 1;
      END IF;
    END IF;
  END PROCESS;

  ClkOut <= Div_1 OR Div_2;

END Behavioral;