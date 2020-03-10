----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2020 20:04:24
-- Design Name: 
-- Module Name: DivFreq_tb - Behavioral
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

entity DivFreq_tb is
end DivFreq_tb;

architecture Behavioral of DivFreq_tb is

component DivFreq is generic(N: integer);
    Port ( clk_i: in STD_LOGIC;
           rst_i: in STD_LOGIC;
           freq_div_o : out STD_LOGIC);
end component;

-- Inputs
signal clk: std_logic := '0';
signal reset   : std_logic := '0';

-- Outputs
signal clk_out : std_logic;

constant clk_period : time := 20 ns; 

begin
 
-- Instancia de la unidad bajo prueba (UUT)
    uut: DivFreq generic map (N => 4)
    PORT MAP (
        clk_i => clk,
        rst_i   => reset,
        freq_div_o  => clk_out
    );
 
    -- Definicion del reloj
   entrada_process : process
       begin

       clk <= '0';
       wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
        
    end process;
 
    -- Procesamiento de estimulos
    estimulos: process
    begin
        reset <= '1'; -- Condiciones iniciales
        wait for 100 ns;
        reset <= '0'; -- Funciona
        wait;
    end process;

end Behavioral;