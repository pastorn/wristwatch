library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.utils_pkg.all;


entity top_level is

  port(
    n_reset               : in    std_logic;
    clk                   : in    std_logic
    
  );

end entity;

architecture str of top_level is
begin
  -- i_time_keeper : 


  process(n_reset, clk) is
  begin

    if n_reset = '0' then
      -- reset

    elsif rising_edge(clk) then
      -- normal operation

    end if;

  end process;
end architecture;

