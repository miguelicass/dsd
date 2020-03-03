----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2020 22:15:53
-- Design Name: 
-- Module Name: FullAdder_tb - Behavioral
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

entity FullAdder_tb is
--  Port ( );
end FullAdder_tb;

architecture Behavioral of FullAdder_tb is

component FullAdder is
Port( a_i : in std_logic;
          b_i : in std_logic;
          c_i : in std_logic;
          c_o : out std_logic;
          s_o : out std_logic);
end component;
--inputs
signal a,b,c_entrada : STD_LOGIC := '0';
--outputs
signal c_salida,s : STD_LOGIC;

begin

uut: FullAdder
  port map(
   a_i =>a,
   b_i =>b,
   c_i =>c_entrada,
   c_o =>c_salida,
   s_o =>s);
   
stim_proc: process

    begin
    wait for 100 ns; -- hold reset state for 100 ns
    -- a= '0', b = '0'
    wait for 10 ns;
    a <= '1'; -- a = '1', b = '0'
    wait for 10 ns;
    b <= '1'; -- a = '1', b = '1'
    wait for 10 ns;
    a <= '0'; -- a = '0', b = '1'
    wait for 10 ns;
    c_entrada <= '1';
    --wait for 10 ns;
    wait; -- end simulation
    end process;

end Behavioral;
