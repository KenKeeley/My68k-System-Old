----------------------------------------------------------------------------------------------------
--
-- FileName:    Support.vht
-- Description: MainBoard Support CPLD Top Level Test Bench.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Support_TB IS
END Support_TB;

ARCHITECTURE Behavior OF Support_TB IS

  -- Component Declaration for the Support
  COMPONENT Support
    PORT (
      nReset : IN STD_LOGIC;                                                    -- Reset
      Clk : IN STD_LOGIC;                                                       -- Clock
      CPU_Clock : OUT  STD_LOGIC;                                               -- CPU Clock
      PS2_Clock : OUT  STD_LOGIC                                                -- PS2 Clock
    );
  END COMPONENT;

  -- Inputs
  SIGNAL nReset : STD_LOGIC := '0';
  SIGNAL Clk : STD_LOGIC := '0';

  -- Outputs
  SIGNAL CPU_Clock : STD_LOGIC;
  SIGNAL PS2_Clock : STD_LOGIC;

  -- Clock Period Definition
  CONSTANT clk_period : TIME := 20 NS;

BEGIN

  -- Instantiate the Support
  UUT : Support PORT MAP (
    nReset => nReset,
    Clk => Clk,
    CPU_Clock => CPU_Clock,
    PS2_Clock => PS2_Clock
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

    WAIT FOR 45 NS;
    nReset <= '1';

    WAIT;
  END PROCESS;

END Behavior;