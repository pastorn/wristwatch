library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.utils_pkg.all;

entity top_level_tb is
end entity;

architecture sim of top_level_tb is

  -- Simulation specific
  signal sim_alive  : boolean   := true;

  -- start in reset state
  signal n_reset    : std_logic := '0';
  signal clk        : std_logic := '0';

  -- signals
  signal  seven_seg : std_logic_vector(6 downto 0);

  -- signal  time_hr  : unsigned range 0 to 23;
  -- signal  time_min : unsigned range 0 to 59;
  -- signal  time_sec : unsigned range 0 to 59;
  
begin

  i_top_level_testing : entity work.top_level(str)
  port map(
    n_reset     => n_reset,
    clk         => clk);

  p_clk : process is
  begin
    if sim_alive then
      -- report "clock goes up, clock goes down - can't explain that";
      clk <= not clk;
      wait for clk_period / 2;
    else
      wait;
    end if;
  end process p_clk;

  -- Test bench processes
  p_top_tb : process is
  begin
    
    n_reset <= '0';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    n_reset <= '1';
    wait until rising_edge(clk);

    seven_seg <= fn_seven_seg_vec(2);
    if seven_seg = "0100100" then
      report "Function call executed properly!";
    else 
      report "Function call failed!";
    end if;

    sim_alive <= false;

    assert false 
      report "TB process done!"
      severity FAILURE;
  end process p_top_tb;
end architecture;

