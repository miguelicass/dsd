----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2020 04:25:03 PM
-- Design Name: 
-- Module Name: FullAdderNbits - Behavioral
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

entity FullAdderNbits is
    port(a_i : in STD_LOGIC_VECTOR(3 downto 0);
         b_i : in STD_LOGIC_VECTOR(3 downto 0);
         c_i : in STD_LOGIC;
         c_o : out STD_LOGIC;
         s_o : out STD_LOGIC_VECTOR(3 downto 0)
         );
end FullAdderNbits;

architecture Behavioral of FullAdderNbits is

component FullAdder is
port(a_i : in STD_LOGIC;
     b_i : in STD_LOGIC;
     c_i : in STD_LOGIC;
     c_o : out STD_LOGIC;
     s_o : out STD_LOGIC);
end component;

--SALIDAS INTERMEDIAS
signal c1_inter, c2_inter, c3_inter : STD_LOGIC;

begin

FullAdder1 : FullAdder
port map( a_i => a_i(0),
          b_i => b_i(0),
          c_i => c_i,
          c_o => c1_inter,
          s_o => s_o(0)
         );
         
FullAdder2 : FullAdder
port map( a_i => a_i(1),
          b_i => b_i(1),
          c_i => c1_inter,
          c_o => c2_inter,
          s_o => s_o(1)
          );  
          
FullAdder3 : FullAdder
port map( a_i => a_i (2),
          b_i => b_i (2),
          c_i => c2_inter,
          c_o => c3_inter,
          s_o => s_o(2)
         );
         
FullAdder4 : FullAdder
port map(
 a_i => a_i (3),
          b_i => b_i (3),
          c_i => c3_inter,
          c_o => c_o,
          s_o => s_o(3)
         );
    

end Behavioral;


