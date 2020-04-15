----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2020 13:34:31
-- Design Name: 
-- Module Name: Manager0s1sROM - Behavioral
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

entity Manager0s1sROM is
    Port ( rst_m_i : in STD_LOGIC;
           clk_m_i : in STD_LOGIC;
    	   e_m_i : in STD_LOGIC;
    	   s_m_o : out STD_LOGIC);
end Manager0s1sROM;

architecture Behavioral of Manager0s1sROM is

--components
component DivFreq is generic (N : INTEGER );--:= 4);
    port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           freq_div_o : out STD_LOGIC);
end component;

component ROM is
    Port ( a_i : in STD_LOGIC_VECTOR (3 downto 0);
           d_o : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component Contador_Johnson is generic (N : INTEGER );--:= 3);
port( clk_i : in std_logic;
	  rst_i: in std_logic;
	  en_i : in std_logic;
	  l_i : in std_logic;
	  c_i : in std_logic;
	  --data_i : in std_logic_vector(N-1 downto 0);
	  data_parallel_i : in std_logic_vector(N-1 downto 0);
	  q_o : out std_logic_vector(N-1 downto 0));
end component;

--signal auxiliares
signal enable : STD_LOGIC;
signal q : STD_LOGIC_VECTOR ( 2 downto 0);
signal a : STD_LOGIC_VECTOR ( 3 downto 0);
signal d : STD_LOGIC_VECTOR ( 4 downto 0);


begin

	DivisorFrequencia : DivFreq generic map (N => 2 )-- probar con 2 para sim -- 1Hz  clk => 10 ns, N => 100000000
    port map( clk_i => clk_m_i,
           rst_i => rst_m_i,
           freq_div_o => enable);

    memory : ROM 
    port map (
        a_i => a,
        d_o => d);

    counter : Contador_Johnson
    generic map (N => 3) 
    port map (clk_i => clk_m_i,
              rst_i => rst_m_i,
              en_i => '1', --enable, --para simular lo ponemos a 1
              l_i => d(4), 
              c_i => d(3),
              --data_i => ,
              data_parallel_i => d( 2 downto 0),
              q_o => q);
    
    a <= e_m_i & q;
    
    --S    =       /Q2          /Q1      Q0      +   Q2       Q1           /Q0
    s_m_o <= ( not q(2) and not q(1) and q(0) ) or ( q(2) and q(1) and not q(0) ) ;

end Behavioral;