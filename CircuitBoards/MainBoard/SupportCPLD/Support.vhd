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
    CPU_Clock : OUT  STD_LOGIC;                                                 -- CPU Clock
    PS2_Clock : OUT  STD_LOGIC                                                  -- PS2 Clock
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

END Behavioral;