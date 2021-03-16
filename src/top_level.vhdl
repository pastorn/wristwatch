library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.utils_pkg.all;


entity top_level is

  port(
    n_reset     : in    std_logic;
    clk         : in    std_logic;
    
    time_data   : inout time_data
  );

end entity;

architecture str of top_level is
  -- signal td : time_data;
begin


  i_time_keeper : entity work.time_keeper(rtl)
  port map(
    clk     => clk,
    n_reset => n_reset,
    td      => time_data);


  process(n_reset, clk) is
  begin

    if n_reset = '0' then
      -- reset

    elsif rising_edge(clk) then
      -- normal operation

    end if;

  end process;
end architecture;

