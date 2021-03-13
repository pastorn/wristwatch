library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;


package utils_pkg is
  ----------------------------------------
  --- CONSTANTS
  ----------------------------------------
  constant  clk_freq    : natural := 10000; -- 10 kHz
  constant  clk_period  : time    := 1000 ms / clk_freq;

  ----------------------------------------
  --- TYPES
  ----------------------------------------
  type time_data is record
    -- to represent 0 to  24:  five bits (16)
    hours     : std_logic_vector(4 downto 0);
    -- to represent 0 to  60:   six bits (32)
    minutes   : std_logic_vector(5 downto 0);
    seconds   : std_logic_vector(5 downto 0);
    -- to represent 0 to 100: seven bits (64)
    hundreds  : std_logic_vector(6 downto 0);
  end record time_data;

  ----------------------------------------
  --- FUNCTION DECLARATIONS
  ----------------------------------------
  function fn_seven_seg_vec(
    nbr : natural range 0 to 9
  ) return std_logic_vector;

end package utils_pkg;



package body utils_pkg is

  function fn_seven_seg_vec(
    nbr : natural range 0 to 9
  ) return std_logic_vector is
  begin
    case nbr is 
      when 0 => return "1111111"; -- '0'
      when 1 => return "1111001"; -- '1'
      when 2 => return "0100100"; -- '2'
      when 3 => return "0110000"; -- '3'
      when 4 => return "0011001"; -- '4'
      when 5 => return "0010010"; -- '5'
      when 6 => return "0000010"; -- '6'
      when 7 => return "1111000"; -- '7'
      when 8 => return "0000000"; -- '8'
      when 9 => return "0011000"; -- '9'
    end case;
  end function;

end package body utils_pkg;

