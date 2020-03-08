----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2020 20:10:31
-- Design Name: 
-- Module Name: Display7_Segmentos - Behavioral
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

entity Display7_Segmentos is
    Port (  a_i : in  STD_LOGIC_VECTOR (3 downto 0);  
            b_i : in  STD_LOGIC_VECTOR (3 downto 0);  
            s_i : in  STD_LOGIC_VECTOR (3 downto 0);
            c_i : in STD_LOGIC;
            v_i : in STD_LOGIC;
            op_i : in STD_LOGIC;
            freq_div_i : in STD_LOGIC;
            en_o : out STD_LOGIC_VECTOR(3 downto 0);      
            segments_o : out  STD_LOGIC_VECTOR (7 downto 0));  
end Display7_Segmentos;

architecture Behavioral of Display7_Segmentos is

begin

   with s_i select
      segments_o <= "00000011" when "0000",  -- 0
                  "10011111" when "0001",  -- 1
                  "00100101" when "0010",  -- 2
                  "00001101" when "0011",  -- 3
                  "10011001" when "0100",  -- 4
                  "01001001" when "0101",  -- 5
                  "01000001" when "0110",  -- 6
                  "00011101" when "0111",  -- 7
                  "00000001" when "1000",  -- 8
                  "00011001" when "1001",  -- 9
                  "00010001" when "1010",  -- A
                  "11000001" when "1011",  -- B
                  "01100011" when "1100",  -- C
                  "10000101" when "1101",  -- D
                  "01100001" when "1110",  -- E
                  "01110001" when "1111",  -- F
                  "11111111" when others;  -- blank

end Behavioral;
