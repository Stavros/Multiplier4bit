-- Engineer:	Stavros Kalapothas
-- Create Date:	22/12/2019
-- Project Name: ask1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier4bit is
 port ( A: in STD_LOGIC_VECTOR (3 downto 0);
	B: in STD_LOGIC_VECTOR (3 downto 0);
	S: out STD_LOGIC_VECTOR (7 downto 0));
end multiplier4bit;
 
architecture Behavioral of multiplier4bit is
 
-- Full Adder 1bit Component Decalaration
component full_adder_vhdl_code
 port ( A,B: in STD_LOGIC;
	Cin: in STD_LOGIC;
	Cout: out STD_LOGIC;
	S: out STD_LOGIC);
end component;

-- Half Adder 1bit Component Decalaration
component half_adder_vhdl_code
 port ( A,B: in STD_LOGIC;
	Cout: out STD_LOGIC;
	S: out STD_LOGIC);
end component;

-- Intermediate declaration
signal AB0, AB1, AB2, AB3: STD_LOGIC_VECTOR (3 downto 0);
signal C1, C2, C3: STD_LOGIC_VECTOR (3 downto 0);
signal P1, P2, P3: STD_LOGIC_VECTOR (3 downto 0);

begin
-- Multiplier input
AB0(0) <= A(0) and B(0);
AB0(1) <= A(1) and B(0);
AB0(2) <= A(2) and B(0);
AB0(3) <= A(3) and B(0);

AB1(0) <= A(0) and B(1);
AB1(1) <= A(1) and B(1);
AB1(2) <= A(2) and B(1);
AB1(3) <= A(3) and B(1);

AB2(0) <= A(0) and B(2);
AB2(1) <= A(1) and B(2);
AB2(2) <= A(2) and B(2);
AB2(3) <= A(3) and B(2);

AB3(0) <= A(0) and B(3);
AB3(1) <= A(1) and B(3);
AB3(2) <= A(2) and B(3);
AB3(3) <= A(3) and B(3);

-- Port Mapping Full Adder 8 times and Half Adder 4 times
FA1: full_adder_vhdl_code port map( AB0(2), AB1(1), C1(0), C1(1), P1(1));
FA2: full_adder_vhdl_code port map( AB0(3), AB1(2), C1(1), C1(2), P1(2));
FA3: full_adder_vhdl_code port map( P1(2), AB2(1), C2(0), C2(1), P2(1));
FA4: full_adder_vhdl_code port map( P1(3), AB2(2), C2(1), C2(2), P2(2));
FA5: full_adder_vhdl_code port map( C1(3), AB2(3), C2(2), C2(3), P2(3));
FA6: full_adder_vhdl_code port map( P2(2), AB3(1), C3(0), C3(1), P3(1));
FA7: full_adder_vhdl_code port map( P2(3), AB3(2), C3(1), C3(2), P3(2));
FA8: full_adder_vhdl_code port map( C2(3), AB3(3), C3(2), C3(3), P3(3));
HA1: half_adder_vhdl_code port map( AB0(1), AB1(0), C1(0), P1(0));
HA2: half_adder_vhdl_code port map( AB1(3), C1(2), C1(3), P1(3));
HA3: half_adder_vhdl_code port map( P1(1), AB2(0), C2(0), P2(0));
HA4: half_adder_vhdl_code port map( P2(1), AB3(0), C3(0), P3(0));

-- Mulitplier output
S(0)<= AB0(0);
S(1)<= P1(0);
S(2)<= P2(0);
S(3)<= P3(0);
S(4)<= P3(1);
S(5)<= P3(2);
S(6)<= P3(3);
S(7)<= C3(3);

end Behavioral;