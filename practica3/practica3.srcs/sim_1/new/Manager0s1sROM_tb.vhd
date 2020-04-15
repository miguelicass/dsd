----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2020 17:23:44
-- Design Name: 
-- Module Name: Manager0s1sROM_tb - Behavioral
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

entity Manager0s1sROM_tb is
--  Port ( );
end Manager0s1sROM_tb;

architecture Behavioral of Manager0s1sROM_tb is

component Manager0s1sROM is
    Port ( rst_m_i : in STD_LOGIC;
           clk_m_i : in STD_LOGIC;
    	   e_m_i : in STD_LOGIC;
    	   s_m_o : out STD_LOGIC);
end component;

--inputs
signal clk, rst, e : STD_LOGIC := '0';

--outputs
signal s : STD_LOGIC;

----test enable
--signal en : std_logic := '0';
--constant clk_period : time:= 10 ns;

begin

    uut : Manager0s1sROM port map (
        rst_m_i => rst,
        clk_m_i => clk,
        e_m_i => e,
        s_m_o => s
    );
    
    --clock
    clk <= not clk after 5 ns;
    
    
--  --test enable
--  clk_enable :process
--   begin
--                en <= '0';
--               wait for (clk_period * 2)-clk_period; -- El numero real seria => 1000000, para que fuera cada 10ms
--                                        -- Ponemos un numero  mas reducido, 5, para que todos quepan en el time
--                en <= '1';
--               wait for clk_period;
--   end process;  
 
    process
    begin
        rst <= '1';
        wait for 10 ns;
        
        rst <= '0';
        --wait for 5 ns;
         
        --1s impar
        e <= '1';
        wait for 30 ns;

        --0s impar
        e <= '0';
        wait for 30 ns;
        
        --1s par
        e <= '1';
        wait for 40 ns;

        --0s par
        e <= '0';
        wait for 40 ns;

        e <= '1';
        wait for 10 ns;
        
        --rst
        rst <= '1';
        e <= '0';
        wait for 10 ns;
        
        e <= '1';
        rst <= '0';
        wait for 10 ns;
        
        e <= '0';
        wait for 10 ns;
        
        e <= '1';
        wait for 20 ns;
        
        wait;
    end process;

end Behavioral;