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

entity Manager is generic (N : integer := 4);
    Port ( clk_m_i : in STD_LOGIC;
           rst_m_i : in STD_LOGIC;
           a_m_i : in STD_LOGIC_VECTOR(N-1 downto 0);
           b_m_i : in STD_LOGIC_VECTOR(N-1 downto 0);
           op_m_i : in STD_LOGIC;
           en_m_o : out STD_LOGIC_VECTOR(7 downto 0);
           segments_m_o : out  STD_LOGIC_VECTOR (7 downto 0)); 
end Manager;

architecture Behavioral of Manager is

component DivFreq is generic (N : INTEGER );--:= 4);
    port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           freq_div_o : out STD_LOGIC);
end component;

component FullAdderNbits is generic (N : INTEGER );--:= 4);
    port(a_i : in STD_LOGIC_VECTOR(N-1 downto 0);
         b_ini : in STD_LOGIC_VECTOR(N-1 downto 0);
         op_i : in STD_LOGIC;
         c_out : out STD_LOGIC;
         v_o : out STD_LOGIC;
         s_o : out STD_LOGIC_VECTOR(N-1 downto 0)
         );
end component;


component Display7_Segmentos is generic (N : INTEGER );
    port (  a_i : in  STD_LOGIC_VECTOR (3 downto 0);  
            b_i : in  STD_LOGIC_VECTOR (3 downto 0);  
            s_i : in  STD_LOGIC_VECTOR (3 downto 0);
            c_i : in STD_LOGIC;
            v_i : in STD_LOGIC;
            op_i : in STD_LOGIC;
            clk_i : in STD_LOGIC;
            rst_i : in STD_LOGIC;
            freq_div_i : in STD_LOGIC;
            en_o : out STD_LOGIC_VECTOR(7 downto 0);      
            segments_o : out  STD_LOGIC_VECTOR (7 downto 0));  
end component;

--signal a : STD_LOGIC;
--signal b : STD_LOGIC;
signal carry : STD_LOGIC;
signal verflow : STD_LOGIC;
signal enable : STD_LOGIC;
signal salida :STD_LOGIC_VECTOR ( 3 downto 0);

begin

DivisorFrequencia : DivFreq generic map (N => 1000000 )-- probar con 5 para sim -- 10ms = 10000Hz // clk => 10 ns
    port map( clk_i => clk_m_i,
           rst_i => rst_m_i,
           freq_div_o => enable);

FullAdder4bits : FullAdderNbits generic map (N => 4 )
    port map(a_i => a_m_i,
         b_ini => b_m_i,
         op_i => op_m_i,
         c_out => carry,
         v_o => verflow,
         s_o => salida);


Display : Display7_Segmentos generic map (N => 6)
    port map ( a_i => a_m_i,
    			b_i => b_m_i,  
    		    s_i => salida,
    		    c_i => carry,
    		    v_i => verflow,
    		    op_i => op_m_i,
                clk_i => clk_m_i,
                rst_i => rst_m_i,
    		    freq_div_i => enable,
    		   	en_o => en_m_o,   
                segments_o => segments_m_o);


end Behavioral;























