----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2020 04:01:30 PM
-- Design Name: 
-- Module Name: FullAdder - Behavioral
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

entity FullAdder is
port(a_i : in STD_LOGIC;
     b_i : in STD_LOGIC;
     c_i : in STD_LOGIC;
     c_o : out STD_LOGIC;
     s_o : out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is

component HalfAdder is 
Port     ( a_i : in STD_LOGIC;
           b_i : in STD_LOGIC;
           c_o : out STD_LOGIC;
           s_o : out STD_LOGIC);
end component;
--salidas
signal salida_s1,salida_c1,salida_c2 : STD_LOGIC;

begin

HalfAdder1 : HalfAdder
--Valor por cada adder
port map(a_i=> a_i,
         b_i=> b_i,
         c_o=> salida_c1,
         s_o=> salida_s1);

HalfAdder2 : HalfAdder
         --Valor por cada adder
         port map(a_i=> salida_s1,
                  b_i=> c_i,
                  c_o=> salida_c2,
                  s_o=> s_o);
                  
 c_o <= salida_c1 or salida_c2;
 

end Behavioral;
