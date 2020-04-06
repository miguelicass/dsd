----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2020 20:17:59
-- Design Name: 
-- Module Name: MooreFSM_tb - Behavioral
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

entity MooreFSM_tb is
--  Port ( );
end MooreFSM_tb;

architecture Behavioral of MooreFSM_tb is

    component MooreFSM is
        Port ( rst_i : in STD_LOGIC;
               clk_i : in STD_LOGIC;
               e_i : in STD_LOGIC;
               s_o : out STD_LOGIC);
    end component;

    signal clk, rst, e : STD_LOGIC := '0';
    signal s : STD_LOGIC;
    
begin

    uut : MooreFSM port map (
        rst_i => rst,
        clk_i => clk,
        e_i => e,
        s_o => s
    );
    
    clk <= not clk after 5 ns;
    
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