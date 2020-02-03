-- Engineer:	Stavros Kalapothas
-- Create Date:	22/12/2019
-- Project Name: half_adder_1bit

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity half_adder_vhdl_code is
  port (
    A  : in std_logic;
    B  : in std_logic;
    Cout   : out std_logic;
    S : out std_logic
    );
end half_adder_vhdl_code;
 
architecture rtl of half_adder_vhdl_code is
begin
  S   <= A xor B;
  Cout <= A and B;
end rtl;