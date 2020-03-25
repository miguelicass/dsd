----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2020 16:20:48
-- Design Name: 
-- Module Name: ComportamentalAddSub_tb - Behavioral
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

entity ComportamentalAddSub_tb is generic (N : INTEGER := 4);
--  Port ( );
end ComportamentalAddSub_tb;

architecture Dataflow of ComportamentalAddSub_tb is

component ComportamentalAddSub is generic (N : INTEGER );
port(a_i : in STD_LOGIC_VECTOR(N-1 downto 0) ;
     b_ini : in STD_LOGIC_VECTOR(N-1 downto 0);
     op_i : in STD_LOGIC;
     c_out : out STD_LOGIC;
     v_o : out STD_LOGIC;
     s_o : out STD_LOGIC_VECTOR(N-1 downto 0)
     );
end component;
--entradas
signal a : STD_LOGIC_VECTOR (N-1 downto 0);
signal b : STD_LOGIC_VECTOR(N-1 downto 0);
signal op_entrada : STD_LOGIC := '0';

--salidas
signal s : STD_LOGIC_VECTOR(N-1 downto 0);
signal c_salida : STD_LOGIC;
signal v_salida : STD_LOGIC;
--signal baux : STD_LOGIC_VECTOR(3 downto 0);

begin

uut: ComportamentalAddSub generic map (N => 4 )
port map(
     a_i => a,
     b_ini => b,
     op_i => op_entrada,
     c_out => c_salida,
     v_o => v_salida,
     s_o =>s
     );

stim_proc: process
begin
a<="0000";
b<="0000";
wait for 100 ns; -- hold reset state for 100 ns
-- a= '0', b = '0'
wait for 10 ns;
op_entrada <= '1';
wait for 10 ns;
-- b = '7'
b <= "0111";
wait for 10 ns;
--a = '3'
a <= "0011";
wait for 10 ns;
op_entrada <= '0';
wait for 10 ns;
--RESET
-- a= '0', b = '0'
a<="0000";
b<="0000";
wait for 30 ns;
op_entrada <= '1';
wait for 10 ns;
-- b = 'c'
b <= "1100"; 
wait for 10 ns;
-- a = 'f'
a <= "1111";
wait for 10 ns; 
op_entrada <= '0';
wait for 10 ns;
wait; -- end simulation
end process;


end Dataflow;
