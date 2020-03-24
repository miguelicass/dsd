----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2020 20:31:35
-- Design Name: 
-- Module Name: Manager_tb - Behavioral
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

entity Manager_tb is
--  Port ( );
end Manager_tb;

architecture Behavioral of manager_tb is

component manager is
    generic(N: integer);
    Port ( clk_m_i : in STD_LOGIC;
           rst_m_i : in STD_LOGIC;
           a_m_i : inout STD_LOGIC_VECTOR(N-1 downto 0);
           b_m_i : inout STD_LOGIC_VECTOR(N-1 downto 0);
           op_m_i : in STD_LOGIC;
           en_m_o : out STD_LOGIC_VECTOR(7 downto 0);
           segments_m_o : out  STD_LOGIC_VECTOR (7 downto 0)); 
    end component;

   --inputs
   signal a_m : std_logic_vector(3 downto 0);
   signal b_m : std_logic_vector(3 downto 0);
   signal op_m : STD_LOGIC := '0';
   signal clk_m : STD_LOGIC := '0';
   signal rst_m : STD_LOGIC := '0';
   
   --outputs
   signal en_m : STD_LOGIC_VECTOR(7 downto 0);
   signal segments_m : STD_LOGIC_VECTOR(7 downto 0);
   
   --constante
   constant clk_period : time := 10 ns;


BEGIN
    --Arreglar variables de entrada, frecuencia, displays etc...
   uut: manager generic map (N => 4)
    PORT MAP ( a_m_i => a_m,
                b_m_i => b_m,
                op_m_i => op_m,
                clk_m_i => clk_m,
                rst_m_i => rst_m,
                en_m_o => en_m,
                segments_m_o => segments_m);
        
        
   clk_process :process
   begin
                clk_m <= '0';
               wait for clk_period/2;
                clk_m <= '1';
               wait for clk_period/2;
   end process;      
   
   stim_proc: process
   begin                
   a_m <= "0000";
   b_m <= "0000";
   --rst_m <= '1';
   
   wait for 50 ns;
   a_m <= "0001";
   b_m <= "0001";
   --rst_m <= '0';
   
   wait for 450 ns;
   a_m <= "0010";
   b_m <= "0010";
   op_m <= '1';
   
   wait for 450 ns;
   a_m <= "1111";
   b_m <= "0100";
   op_m <= '0';
   
   wait for 450 ns;
   a_m <= "0111";
   b_m <= "1101";
   
   wait for 450 ns;
   a_m <= "0011";
   b_m <= "0100";
   op_m <= '1';
   
   wait for 450 ns;
   end process;

END;
