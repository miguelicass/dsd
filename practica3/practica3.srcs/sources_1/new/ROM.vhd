----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2020 13:19:34
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( a_i : in STD_LOGIC_VECTOR (3 downto 0);
           d_o : out STD_LOGIC_VECTOR (4 downto 0));
end ROM;

architecture Behavioral of ROM is

    type memory is array (0 to 15) of STD_LOGIC_VECTOR(4 downto 0);

    constant my_memory : memory := (
        0 | 1 | 3 | 12 | 15 => "00000",
        4 | 6 | 11 => "01000",
        7  => "10100",
        8  => "10111",
        9  => "10110",
        14 => "10011",
        others => "10000");
     
begin

    d_o <= my_memory(to_integer(unsigned(a_i)));


end Behavioral;
