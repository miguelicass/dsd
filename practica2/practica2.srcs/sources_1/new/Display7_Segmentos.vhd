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
            clk_i : in STD_LOGIC;
            rst_i : in STD_LOGIC;
            freq_div_i : in STD_LOGIC;
            en_o : out STD_LOGIC_VECTOR(3 downto 0);      
            segments_o : out  STD_LOGIC_VECTOR (7 downto 0));  
end Display7_Segmentos;

architecture Behavioral of Display7_Segmentos is
        
    signal led: STD_LOGIC_VECTOR (7 downto 0);
    signal anodo:STD_LOGIC_VECTOR ( 3 downto 0);
    
    type state is (display0, display1, display2, display3);
    signal token, next_token : state := display0;


begin

   with led select
      --se enciende a alto nivel
      segments_o <= "11111100" when "0000",  -- 0
--                  "00000011" when "0000",  -- 0
                  "01100000" when "0001",  -- 1
--                "10011111" when "0001",  -- 1
                  "11011010" when "0010",  -- 2
--                "00100101" when "0010",  -- 2
                  "11110010" when "0011",  -- 3
--                "00001101" when "0011",  -- 3
                  "01100110" when "0100",  -- 4
--                "10011001" when "0100",  -- 4
                  "10110110" when "0101",  -- 5
--                "01001001" when "0101",  -- 5
                  "10111110" when "0110",  -- 6
--                "01000001" when "0110",  -- 6
                  "11100010" when "0111",  -- 7
--                "00011101" when "0111",  -- 7
                  "11111110" when "1000",  -- 8
--                "00000001" when "1000",  -- 8
                  "11100100" when "1001",  -- 9
--                "00011011" when "1001",  -- 9
                  "11101110" when "1010",  -- A
--                "00010001" when "1010",  -- A
                  "00111110" when "1011",  -- B
--                "11000001" when "1011",  -- B
                  "10011100" when "1100",  -- C
--                "01100011" when "1100",  -- C
                  "01111010" when "1101",  -- D
--                "10000101" when "1101",  -- D
                  "10011110" when "1110",  -- E
--                "01100001" when "1110",  -- E
                  "10001110" when "1111",  -- F
--                "01110001" when "1111",  -- F
                  "00000000" when others;  -- blank
--                "11111111" when others;  -- blank

      --end case;

      token_control : process(rst_i, clk_i)
            begin
                  if rst_i = '1' then
                     token <= display0;
                        
                  elsif clk_i'event and clk_i = '1' then
                     token <= next_token;
                  end if;
            end process;

       --aunque cambie el token arriba, solo se fera reflejado cuaando el divisor de frecuencia este encendido
      show_display : process(token, freq_div_i)
           begin
               case token is

                   when display0 =>
                        anodo <= "0111"; 
                        led <=  a_i;
                        if freq_div_i = '1' then
                             next_token <= display1;
                        end if;
       
                   when display1 =>
                        anodo <= "1011";   
                        led <=  b_i; 
                        if freq_div_i = '1' then
                            next_token <= display2;                                           
                        end if;
       
                   when display2 =>
                        anodo <= "1101";   
                        led <=  s_i;
                        if freq_div_i = '1' then
                           next_token <= display3;                            
                        end if;

                   when display3 =>
                        anodo <= "1110";
                        if op_i = '0'  then 
                              led <= "000"&c_i ;
                        else
                              led <= "000"&v_i ;
                        end if;
                        if freq_div_i = '1' then
                           next_token <= display0;                         
                        end if;

                   --no es necesario
                   when others =>
                       anodo <= "1111";

               end case;
       
           end process;
            
            en_o <= anodo;

end Behavioral;
