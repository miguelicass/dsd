----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2020 13:39:09
-- Design Name: 
-- Module Name: Contador_Johnson_tb - Behavioral
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

entity Contador_Johnson_tb is generic (N : INTEGER := 3);
--  Port ( );
end Contador_Johnson_tb;

architecture Behavioral of Contador_Johnson_tb is

component Contador_Johnson is generic (N : INTEGER );--:= 3);
       Port(clk_i : in std_logic;
            rst_i: in std_logic;
            --en_i : in std_logic;
            c_i : in std_logic;
            l_i : in std_logic;
            --data_i : in std_logic_vector(N-1 downto 0);
            data_parallel_i : in std_logic_vector(N-1 downto 0);
            q_o : out std_logic_vector(N-1 downto 0)
       );
    end component;  
   
   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   --signal en : std_logic := '0';
   signal l : std_logic := '0';
   signal c : std_logic := '0';
   --signal data_e  : std_logic_vector(N-1 downto 0) := "000";
   signal data_parallel  : std_logic_vector(N-1 downto 0) := "111";

   --Outputs
   signal q_s  : std_logic_vector(N-1 downto 0);
   
   --Constante
   --constant clk_period : time:= 10 ns;

begin
    uut : Contador_Johnson generic map (N => 3)
    Port map(
        clk_i => clk,
        rst_i => rst,
        --en_i => en,
        c_i => c,
        l_i => l,
        --data_i => data_e,
        data_parallel_i => data_parallel,
        q_o => q_s
    );

    clk <= not clk after 5 ns;
    
--  clk_enable :process
--   begin
--                en <= '0';
--               wait for (clk_period * 5)-clk_period; -- El numero real seria => 1000000, para que fuera cada 10ms
--                                        -- Ponemos un numero  mas reducido, 5, para que todos quepan en el time
--                en <= '1';
--               wait for clk_period;
--   end process;      


    process
    begin 
        rst <= '1';
        wait for 10 ns;
        
        rst <= '0';
        
        l <= '0';
        c <= '0';
        --data_e <= "100";
        wait for 200 ns;

        l <= '1';
        c <= '1';
        --data_e <= "100";
        wait for 200 ns;
        
        l <= '0';
        c <= '1';
        --data_e <= "100";
        wait for 200 ns;

        l <= '1';
        c <= '0';
        --data_e <= "100";
        wait for 200 ns;

        wait;
            
    end process;

end Behavioral;

