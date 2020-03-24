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
    op_i : in STD_LOGIC;
    clk_i : in STD_LOGIC;
    rst_i : in STD_LOGIC;
    freq_div_i : in STD_LOGIC;
    en_o : out STD_LOGIC_VECTOR(7 downto 0);      
    segments_o : out  STD_LOGIC_VECTOR (7 downto 0));  
    end component;

   --inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal s : std_logic_vector(3 downto 0) := (others => '0');
   signal op : STD_LOGIC := '0';
   signal c : std_logic := '0';
   signal v : std_logic := '0';
   signal clk : STD_LOGIC := '0';
   signal rst : STD_LOGIC := '0';
   signal freq_div : STD_LOGIC := '0';
   
   --outputs
   signal en : STD_LOGIC_VECTOR(7 downto 0);
   signal segments : STD_LOGIC_VECTOR(7 downto 0);
   
   --constante
   constant clk_period : time := 10 ns;


BEGIN
    --Arreglar variables de entrada, frecuencia, displays etc...
   uut: Display7_Segmentos generic map (N => 6)
    PORT MAP ( a_i => a,
                b_i => b,
                s_i => s,
                c_i => c,
                v_i => v,
                clk_i => clk,
                op_i => op,
                rst_i => rst,
                freq_div_i  => freq_div,
                en_o => en,
                segments_o => segments);
        
        
   clk_process :process
   begin
                clk <= '0';
               wait for clk_period/2;
                clk <= '1';
               wait for clk_period/2;
   end process;      
   
   clk_enable :process
   begin
                freq_div <= '0';
               wait for clk_period * 5; -- El numero real seria => 1000000, para que fuera cada 10ms
                                        -- Ponemos un numero mas reducido para que todos quepan en el time
                freq_div <= '1';
               wait for clk_period;
   end process;      
   
   stim_proc: process
   begin                
   a <= "0000";
   b <= "0000";
   s <= "0000";
   
   wait for 10 ns;
   a <= "0001";
   b <= "0001";
   s <= "0010";
--   op <= '0';
--   c <= '0';
--   v <= '0';
   
   wait for 500 ns;
   a <= "0010";
   b <= "0001";
   s <= "1111";
   op <= '0';
   c <= '0';
   v <= '0';
   
      wait for 500 ns;
   a <= "1111";
   b <= "0001";
   s <= "0011";
   op <= '0';
   c <= '1';
   v <= '0';
   
   wait for 500 ns;
   a <= "1111";
   b <= "0111";
   s <= "1000";
   c <= '0';
   v <= '0';
   
      wait for 500 ns;
   a <= "0001";
   b <= "0010";
   s <= "1111";
   c <= '0';
   v <= '1';
   
   end process;

END;
