library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.utils_pkg.all;


entity time_keeper is

  port(
    n_reset               : in    std_logic;
    clk                   : in    std_logic;
    current_time          : inout time_data);

end entity time_keeper;

architecture rtl of time_keeper is
  constant hundreth_second_clock_flanks : natural := clk_freq / 100;
begin

  p_time_ticker : process(n_reset, clk) is
  begin

    if n_reset = '0' then
      -- reset
      current_time.hours    <= (others => '0');
      current_time.minutes  <= (others => '0');
      current_time.seconds  <= (others => '0');
      current_time.hundreds <= (others => '0');


    elsif rising_edge(clk) then
      -- normal operation

    end if;

  end process;


end architecture rtl;

