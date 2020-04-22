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
    Port ( rst_i : in STD_LOGIC;
           clk_i : in STD_LOGIC;
           e_i : in STD_LOGIC;
           s_o : out STD_LOGIC);
end Manager0s1sPL;

architecture Behavioral of Manager0s1sPL is

    component Contador_Johnson is generic (N : INTEGER );--:= 3);
        port( clk_i : in std_logic;
	          rst_i: in std_logic;
	          en_i : in std_logic;
	          l_i : in std_logic;
	          c_i : in std_logic;
	          data_parallel_i : in std_logic_vector(N-1 downto 0);
	          q_o : out std_logic_vector(N-1 downto 0));
     end component;
     
    signal d, q : STD_LOGIC_VECTOR(2 downto 0);
    signal l, c, s : STD_LOGIC_VECTOR(2 downto 0);

begin

 counter : Contador_Johnson
    generic map (N => 3) 
    port map (clk_i => clk_i,
              rst_i => rst_i,
              en_i => '1', --enable, --para simular lo ponemos a 1
              l_i => '1',--l, 
              c_i => '1',--c,
              data_parallel_i => d( 2 downto 0),
              q_o => q(2 downto 0));
    
        
--        c <= (e_i and not q(2) and not q(0)) or (q(2) and q(1) and not q(0)) or (e_i and not q(2) and q(0));
--        l <= (e_i and not q(2) and not q(1)) or (e_i and not q(2) and q(1) and q(0)) or (e_i and q(2) and q(1) and not q(0));
--        s <= (not q(2) and not q(1) and q(0)) or (q(2) and q(1) and not q(0));
        d(2) <= (not q(2) and not q(1)) or (q(1) and q(0));
        d(1) <= (not q(2) and not q(1)) or (q(2) and not q(0));
        d(0) <= (not q(1) and not q(0)) or (q(2) and not q(0));
        

end Behavioral;
