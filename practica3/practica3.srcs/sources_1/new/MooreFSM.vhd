----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2018 09:01:17
-- Design Name: 
-- Module Name: Detector0s1sMoore2Processes - Behavioral
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

--Detector0s1sMoore2Processes
entity MooreFSM is
    Port ( rst_i : in STD_LOGIC;
           clk_i : in STD_LOGIC;
           e_i : in STD_LOGIC;
           s_o : out STD_LOGIC);
end MooreFSM;

architecture Behavioral of MooreFSM is

    -- Define the different states of the FSM
    type state is (zero_par, zero_im, uno_imER, uno_im, uno_par, zero_imER);
    -- Keep the current and the next state separately
   signal current_state : state := zero_par;

begin

    transitions : process(rst_i, clk_i)
    begin
        if rst_i = '1' then
            current_state <= zero_par;

        elsif clk_i'event and clk_i = '1' then

            case current_state is

                when zero_par =>
                    if e_i = '1' then
                        current_state <= uno_im;
                    else
                        current_state <= zero_im;
                    end if;
                    

                when zero_im =>
                    if e_i = '1' then
                        current_state <= uno_imER;
                    else
                        current_state <= zero_par;
                    end if;

                when uno_imER =>
                    if e_i = '1' then
                        current_state <= uno_par;
                    else
                        current_state <= zero_im;
                    end if;

                when uno_im =>
                    if e_i = '1' then
                        current_state <= uno_par;
                    else
                        current_state <= zero_im;
                    end if;
                    
                when uno_par =>
                    if e_i = '1' then
                        current_state <= uno_im;
                    else
                        current_state <= zero_imER;
                    end if;
                 
                 when zero_imER =>
                    if e_i = '1' then
                        current_state <= uno_imER;
                    else
                        current_state <= zero_par;
                    end if;

                when others =>
                    current_state <= zero_par;

            end case;

        end if;

    end process;
    
    outputs : process(current_state)
    begin
    -- zero_par, zero_im, uno_imER, uno_im, uno_par, zero_imER
        case current_state is
            when zero_par | zero_im | uno_im | uno_par  =>
                s_o <= '0';
                
            when uno_imER | zero_imER  =>
                s_o <= '1';
                
            when others =>
                s_o <= '0';
                
        end case;

    end process;

end Behavioral;