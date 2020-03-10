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

entity Display7_Segmentos is generic (N : INTEGER);
    Port (  a_i : in  STD_LOGIC_VECTOR (3 downto 0);  
            b_i : in  STD_LOGIC_VECTOR (3 downto 0);  
            s_i : in  STD_LOGIC_VECTOR (3 downto 0);
            c_i : in STD_LOGIC;
            v_i : in STD_LOGIC;
            op_i : in STD_LOGIC;
            clk_i : in STD_LOGIC;
            rst_i : in STD_LOGIC;
            freq_div_i : in STD_LOGIC;
            en_o : out STD_LOGIC_VECTOR(3 downto 0);      
            segments_o : out  STD_LOGIC_VECTOR (7 downto 0));  
end Display7_Segmentos;

architecture Behavioral of Display7_Segmentos is
        
    signal led: STD_LOGIC_VECTOR (3 downto 0);
    signal anodo:STD_LOGIC_VECTOR ( N-1 downto 0);
    signal token :  STD_LOGIC_VECTOR (N-1 downto 0) := (0 => '0', others=> '1');


begin

 en_o <= AN;

    process(led)
    begin
        case led is
        when "0000" => segments_o <= "11111100"; --0
        when "0001" => segments_o <= "01100000"; --1
        when "0010" => segments_o <= "11011010"; --2
        when "0011" => segments_o <= "11110010"; --3                  
        when "0100" => segments_o <= "01100110"; --4
        when "0101" => segments_o <= "10110110"; --5
        when "0110" => segments_o <= "10111110"; --6
        when "0111" => segments_o <= "11100000"; --7
        when "1000" => segments_o <= "11111110"; --8
        when "1001" => segments_o <= "11110110"; --9
        when "1010" => segments_o <= "11111010"; --A
        when "1011" => segments_o <= "00111110"; --B
        when "1100" => segments_o <= "10011100"; --C
        when "1101" => segments_o <= "01111010"; --D
        when "1110" => segments_o <= "10011110"; --E
        when "1111" => segments_o <= "10001110"; --F
        when others => segments_o <= "00000000"; --Blank
        end case;
    end process;


      token_old_control : process(rst_i, clk_i)
            begin
                  if rst_i = '1' then
                     token <= '0'&init_token;
                     
                  elsif clk_i'event and clk_i = '1' then
                     token <= token(0)&token(N-1 downto 1);
                     
--                     0111
--                     1011
--                     1101
--                     1110
                  end if;
            end process;


       --aunque cambie el token_old arriba, solo se fera reflejado cuaando el divisor de frecuencia este encendido
      show_display : process(token, freq_div_i)
           begin
            anodo <= token;
             case token is
               --En caso de estar en el estado: "digit_0"
                        --Damos valores a AN[Led de activacion]
               
                   when "111110" =>
                    led <= a_i;
       
                   when "111101" =>
                    led <= b_i
       
                   when "111011" =>
                    led <= "000"&op_i

                   when "110111" =>
                    led <=  s_in;

                   when "101111" =>
                    led <= "000"&c_i

                   when "011111" =>
                    led <= "000"&v_i

                   when others =>
                    led <= "1111"
       
               end case;
             
       
           end process;

 -- en_o <= anodo;
 

end Behavioral;
