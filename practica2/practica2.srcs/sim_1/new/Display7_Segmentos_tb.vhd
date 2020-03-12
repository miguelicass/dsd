----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2020 18:31:21
-- Design Name: 
-- Module Name: Display7_Segmentos_tb - Behavioral
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

entity Display7_Segmentos_tb is
--  Port ( );
end Display7_Segmentos_tb;

architecture Behavioral of Display7_Segmentos_tb is

component Display7_Segmentos is
    generic(N: integer);
    Port (  a_i : in  STD_LOGIC_VECTOR (3 downto 0);  
    b_i : in  STD_LOGIC_VECTOR (3 downto 0);  
    s_i : in  STD_LOGIC_VECTOR (3 downto 0);
    c_i : in STD_LOGIC;
    v_i : in STD_LOGIC;
    clk_i : in STD_LOGIC;
    rst_i : in STD_LOGIC;
    freq_div_i : in STD_LOGIC;
    en_o : out STD_LOGIC_VECTOR(7 downto 0);      
    segments_o : out  STD_LOGIC_VECTOR (7 downto 0));  
    end component;

    --inputs
   signal clk : std_logic := '0';
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal s : std_logic_vector(3 downto 0) := (others => '0');
   signal c : std_logic;
   signal v : std_logic;
   signal enable : STD_LOGIC_VECTOR(7 downto 0);
   signal reset   : std_logic := '0';
   

   --outputs
   signal segment7 : std_logic_vector(7 downto 0);
   constant clk_period : time := 1 ns;
   signal clk_out : std_logic;

BEGIN
    --Arreglar variables de entrada, frecuencia, displays etc...
   uut: Display7_Segmentos generic map (N=>6)
    PORT MAP ( a_i => a,
                b_i => b,
                s_i => s,
                c_i => c,
                v_i => v,
                clk_i => clk,
                rst_i => reset,
                freq_div_i  => clk_out,
                en_o => enable,
                segments_o => segment7);
        
        
   clk_process :process
   begin
                clk <= '0';
               wait for clk_period/2;
                clk <= '1';
                wait for clk_period/2;
   end process;      
   stim_proc: process
   begin                
   a <= "0000";
   b <= "0000";
   s <= "0000";
   wait for 100 ns;
   a <= "0001";
   b <= "0001";
   s <= "0001";
   wait for 100 ns;
   a <= "0010";
   b <= "0010";
   s <= "0010";
   wait for 100 ns;
   a <= "0011";
   b <= "0011";
   s <= "0011";
   wait for 100 ns;
   a <= "0100";
   b <= "0100";
   s <= "0100";
   wait for 100 ns;
   a <= "0101";
   b <= "0101";
   s <= "0101";
   wait for 100 ns;
   a <= "0110";
   b <= "0110";
   s <= "0110";
   wait for 100 ns;
   a <= "0111";
   b <= "0111";
   s <= "0111";
   wait for 100 ns;
   a <= "1000";
   b <= "1000";
   s <= "1000";
   wait for 100 ns;
   a <= "1001";
   b <= "1001";
   s <= "1001";
   wait for 100 ns;
   
   end process;

END;
