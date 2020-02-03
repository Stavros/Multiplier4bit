-- Engineer:	Stavros Kalapothas
-- Create Date:	22/12/2019
-- Project Name: ask1_tb

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Tb_multiplier4bit IS
   PORT (
        
  -- //////////// CLOCK //////////
   CLOCK_50	: IN STD_LOGIC;

--	//////////// LED //////////
	LED		: OUT STD_LOGIC_VECTOR(7 downto 0);

--	//////////// KEY //////////
	-- KEY		: IN STD_LOGIC_VECTOR(1 downto 0);


--	////////////  GPIO Header //////////
	GPIO_2		: INOUT STD_LOGIC_VECTOR(4 downto 0)
);
END Tb_multiplier4bit;
 
ARCHITECTURE behavior OF Tb_multiplier4bit IS
 
-- Component Declaration for the Unit Under Test (UUT)
 
COMPONENT multiplier4bit
 port ( Clk: in STD_LOGIC;
		Rst: in STD_LOGIC;
		A: in STD_LOGIC_VECTOR (3 downto 0);
	B: in STD_LOGIC_VECTOR (3 downto 0);
	S: out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;
 
--Inputs
signal A : std_logic_vector(3 downto 0) := (others => '0');
signal B : std_logic_vector(3 downto 0) := (others => '0');
--Outputs
signal S : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal clk, rst : STD_LOGIC;


TYPE state_type IS (IDLE,DELAY, LED_ON);
signal state_cur, state_nxt: state_type;
 
BEGIN

clk <= CLOCK_50;
rst <= GPIO_2(0);

-- Instantiate the Unit Under Test (UUT)
uut: multiplier4bit PORT MAP (
A => A,
B => B,
S => S
);
 
-- Stimulus process
stim_proc: process
begin

if rst='1' then
			S<=(others=>'0');
 	elsif (clk'event and clk = '1') then
-- hold reset state for 2 ns.
--wait for 2 ns;
A <= "0110";
B <= "1100";
 
wait for 500 ms;
A <= "1111";
B <= "1101";
 
wait for 500 ms;
A <= "0100";
B <= "0101";
 
wait for 500 ms;
A <= "0010";
B <= "1110";
 
wait for 500 ms;
A <= "1011";
B <= "1011";
 
wait for 500 ms;
wait;
end if;
end process;
LED<= S;
 
END;