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

entity FullAdderNbits is generic (N : integer );--:= 4);
    port(a_i : in STD_LOGIC_VECTOR(N-1 downto 0);
         b_ini : in STD_LOGIC_VECTOR(N-1 downto 0);
         op_i : in STD_LOGIC;
         c_out : out STD_LOGIC;
         v_o : out STD_LOGIC;
         s_o : out STD_LOGIC_VECTOR(N-1 downto 0)
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
--signal c1_inter, c2_inter, c3_inter : STD_LOGIC;
--Asignamos uno mas para inicializar la primera /c_inter(0)/ y guardar la ultima /c_out/
signal c_inter :STD_LOGIC_VECTOR ( N downto 0);

signal bxor_i : STD_LOGIC_VECTOR(N-1 downto 0);

begin

--FullAdder2 : FullAdder
--port map( a_i => a_i(1),
--          b_i => b_i(1),
--          c_i => c1_inter,
--          c_o => c2_inter,
--          s_o => s_o(1)
--          );  
    

--Asignar op_i a la primera c_inter(j)
c_inter(0) <= op_i;

ArrayFullAdder: for j in 0 to N-1 generate 

bxor_i(j) <= b_ini(j) xor op_i;

FA : FullAdder
port map( a_i => a_i(j),
          b_i => bxor_i(j),
          c_i => c_inter(j),
          c_o => c_inter(j+1),
          s_o => s_o(j)
         );
         
end  generate;

--Asignar c_out la ultima op_i
c_out <= c_inter(N);

v_o <= c_inter(N) xor c_inter(N-1) ;


end Behavioral;


