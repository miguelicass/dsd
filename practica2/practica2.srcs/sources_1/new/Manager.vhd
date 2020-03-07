----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2020 20:47:39
-- Design Name: 
-- Module Name: Manager - Behavioral
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

entity Manager is generic (N : integer);--:= 4);
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           a_i : in STD_LOGIC_VECTOR(N-1 downto 0);
           b_ini : in STD_LOGIC_VECTOR(N-1 downto 0);
           op_i : in STD_LOGIC;
           en_o : out STD_LOGIC;
           leds_n_o : out  STD_LOGIC_VECTOR (7 downto 0)); 
end Manager;

architecture Behavioral of Manager is

begin


end Behavioral;
