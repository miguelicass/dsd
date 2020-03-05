----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2020 23:29:18
-- Design Name: 
-- Module Name: DivFreq - Behavioral
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

entity DivFreq is generic (N : INTEGER := 4);
    port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           freq_div_o : out STD_LOGIC);
end DivFreq;

architecture Behavioral of DivFreq is
 
signal counter : INTEGER;

begin



process(clk_i,rst_i) 
    begin

      if (rst_i = '1') then 
        counter <= 0;
        freq_div_o <= '0';
        
      elsif (clk_i'event and clk_i='1') then    
        if (counter = N-1 ) then 
            freq_div_o <= '1';
            counter <= 0;
        else
            counter <= counter+1;
            freq_div_o <= '0';
        end if;   
         
     end if;


end process;

end Behavioral;
