----------------------------------------------------------------------------------------------------
--
-- FileName:    Clock_Div_5.vht
-- Description: Clock Divide by 5 Test Bench.
--
----------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Clock_Div_5_TB IS
END Clock_Div_5_TB;

ARCHITECTURE Behavior OF Clock_Div_5_TB IS

  -- Component Declaration for the Clock_Div_5
  COMPONENT Clock_Div_5
    PORT (
      nReset : IN STD_LOGIC;                                                    -- Reset
      ClkIn : IN STD_LOGIC;                                                     -- Incoming Clock
      ClkOut : OUT  STD_LOGIC                                                   -- Outgoing Clock
    );
  END COMPONENT;

  -- Inputs
  SIGNAL nReset : STD_LOGIC := '0';
  SIGNAL ClkIn : STD_LOGIC := '0';

  -- Outputs
  SIGNAL ClkOut : STD_LOGIC;

  -- Clock Period Definition
  CONSTANT clk_period : TIME := 20 NS;

BEGIN

  -- Instantiate the Clock_Div_5
  UUT : Clock_Div_5 PORT MAP (
    nReset => nReset,
    ClkIn => ClkIn,
    ClkOut => ClkOut
  );

  -- Clock Process Definition
  Clock_Process: PROCESS
  BEGIN
    ClkIn <= '0';
    WAIT FOR clk_period/2;
    ClkIn <= '1';
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