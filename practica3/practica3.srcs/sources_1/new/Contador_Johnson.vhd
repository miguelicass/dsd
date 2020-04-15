----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2020 12:37:19
-- Design Name: 
-- Module Name: Contador_Johnson - Behavioral
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

entity Contador_Johnson is generic (N : INTEGER );--:= 3);
port( clk_i : in std_logic;
	  rst_i: in std_logic;
	  en_i : in std_logic;
	  l_i : in std_logic;
	  c_i : in std_logic;
	  --data_i : in std_logic_vector(N-1 downto 0);
	  data_parallel_i : in std_logic_vector(N-1 downto 0);
	  q_o : out std_logic_vector(N-1 downto 0));
end Contador_Johnson;

architecture Behavioral of Contador_Johnson is

signal data :  STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0');

begin
    process(clk_i, rst_i, en_i)
    begin
    	if (rst_i='1') then
            data<= (others => '0');

        elsif clk_i'event and clk_i = '1' and en_i = '1' then

            if (l_i = '0') then
                if(c_i='0') then
					--data_i(2) <= not data_i(0);
                    --data_i(1) <= data_i(2);
                    --data_i(0) <= data_i(1); 
                    data <= not data(0) & data(N-1 downto 1);
                elsif(c_i='1') then
                    --data_i(1) <= data_i(0);
                    --data_i(2) <= data_i(1);
                    --data_i(0) <= not data_i(2); 
                    data <= data(N-2 downto 0) & not data(N-1);
                end if;

            elsif(l_i = '1') then
                data <= data_parallel_i;
            end if;

        end if;
    end process;
    
 q_o <= data;
 
end architecture;