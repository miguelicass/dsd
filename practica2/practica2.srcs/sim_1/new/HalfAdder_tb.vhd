----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2020 22:08:27
-- Design Name: 
-- Module Name: HalfAdder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HalfAdder_tb is
end HalfAdder_tb;

architecture Behavioral of HalfAdder_tb is
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT HalfAdder
PORT(   a_i : IN  STD_LOGIC;
        b_i : IN  STD_LOGIC;
        s_o : OUT  STD_LOGIC;
        c_o : OUT  STD_LOGIC
     );
END COMPONENT;
--Inputs
signal a_i, b_i : STD_LOGIC := '0';
--Outputs
signal s_o, c_o : STD_LOGIC;

begin

-- Instantiate the Unit Under Test (UUT)
uut: HalfAdder
PORT MAP ( a_i => a_i,
           b_i => b_i,
           s_o => s_o,
           c_o => c_o
        ); 
-- Stimulus process
stim_proc: process
begin
wait for 100 ns; -- hold reset state for 100 ns
-- a= '0', b = '0'
wait for 10 ns;
a_i <= '1'; -- a = '1', b = '0'
wait for 10 ns;
b_i <= '1'; -- a = '1', b = '1'
wait for 10 ns;
a_i <= '0'; -- a = '0', b = '1'
wait for 10 ns;
wait; -- end simulation
end process;

end Behavioral;
