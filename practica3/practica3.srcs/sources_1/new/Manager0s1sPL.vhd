----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2018 18:53:51
-- Design Name: 
-- Module Name: Detector1sMooreRandom - Behavioral
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

entity Manager0s1sPL is
    Port ( clk_m_i : in STD_LOGIC;
           rst_m_i : in STD_LOGIC;
           e_m_i : in STD_LOGIC;
           s_m_o : out STD_LOGIC);
end Manager0s1sPL;

architecture Behavioral of Manager0s1sPL is

	    --components
	component DivFreq is generic (N : INTEGER );
	    port ( clk_i : in STD_LOGIC;
	           rst_i : in STD_LOGIC;
	           freq_div_o : out STD_LOGIC);
	end component;

    component Contador_Johnson is generic (N : INTEGER );--:= 3);
        port( clk_i : in std_logic;
	          rst_i: in std_logic;
	          en_i : in std_logic;
	          l_i : in std_logic;
	          c_i : in std_logic;
	          data_parallel_i : in std_logic_vector(N-1 downto 0);
	          q_o : out std_logic_vector(N-1 downto 0));
     end component;
     

 	--signal auxiliares
	signal enable : STD_LOGIC;
	signal l, c, s : STD_LOGIC;
    signal d, q : STD_LOGIC_VECTOR( 2 downto 0);



begin

 DivisorFrequencia : DivFreq generic map (N => 100000000 )--1Hz => 1000000000 ns // clk => 10 ns, N => 100000000
    port map( clk_i => clk_m_i,
           rst_i => rst_m_i,
           freq_div_o => enable);

 counter : Contador_Johnson
    generic map (N => 3) 
    port map (clk_i => clk_m_i,
              rst_i => rst_m_i,
              en_i => enable, --para simular lo ponemos a '1'
              l_i => l, 
              c_i => c,
              data_parallel_i => d(2 downto 0),
              q_o => q);
    
    	--implementacion puertas logicas
        --L = /E Q2 Q0  +  E Q1 /Q0  +  E /Q2 /Q1										
        l <= (not e_m_i and q(2) and q(0)) or (e_m_i and q(1) and not q(0)) or (e_m_i and not q(2) and not q(1));
        --C = /E Q2  +  E /Q2							
        c <= (not e_m_i and q(2)) or (e_m_i and not q(2));
        --D2 = /E + /Q2						
        d(2) <= (not e_m_i) or (not q(2));
        --D1 = E						
        d(1) <= (e_m_i);
        --D0 = /Q0
        d(0) <= (not q(0));
        
        --salida
        --S = /Q1 Q0  +  Q1 /Q0				
        s_m_o <= (not q(1) and q(0)) or (q(1) and not q(0));


end Behavioral;