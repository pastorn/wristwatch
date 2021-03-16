library ieee;
  use ieee.std_logic_1164.all;
  -- use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library work;
  use work.utils_pkg.all;


entity time_keeper is

  port(
    n_reset       : in    std_logic;
    clk           : in    std_logic;
    td            : inout time_data);

end entity time_keeper;
architecture rtl of time_keeper is
------------------------------------------------------------------------------
---     INTERNAL STATE     
------------------------------------------------------------------------------
  constant hun_clk_flanks : natural := clk_freq / 100;
  signal   clk_tk         : natural range 0 to hun_clk_flanks-1;

  procedure inc_with_overflow(
    signal    sig_to_inc        : inout natural;
    constant  sig_maximum       : in    natural;
    constant  execution_wanted  : in    boolean;
    variable  overflow_flag     :   out boolean) is
  begin
    if execution_wanted then
      if sig_to_inc = sig_maximum - 1 then
        overflow_flag := true;
        sig_to_inc <= 0;
      else
        overflow_flag := false;
        sig_to_inc <= sig_to_inc + 1;
      end if;
    end if;
  end procedure;


begin

------------------------------------------------------------------------------
---     PROCESSES     
------------------------------------------------------------------------------
  p_time_ticker : process(n_reset, clk) is
    variable of_flag : boolean; -- for procedure use
  begin

    if n_reset = '0' then
      -- reset
      td.hrs  <= 0;
      td.min  <= 0;
      td.sec  <= 0;
      td.hun  <= 0;
      clk_tk  <= 0;

    elsif rising_edge(clk) then
      -- normal operation
      
      -- Always run the first call. If there was an overflow of the counter
      -- (clk_tk) then the variable `of_flag` will cascade the running of
      -- the procedure down as long as nessecary. But for most cases `of_flag`
      -- will be false and input `execution_wanted` will be false when
      -- the procedure gets called.
      inc_with_overflow(clk_tk, hun_clk_flanks,    true, of_flag);
      inc_with_overflow(td.hun,            100, of_flag, of_flag);
      inc_with_overflow(td.sec,             60, of_flag, of_flag);
      inc_with_overflow(td.min,             60, of_flag, of_flag);
      inc_with_overflow(td.hrs,             24, of_flag, of_flag);
      
    end if;
  end process;


end architecture rtl;

