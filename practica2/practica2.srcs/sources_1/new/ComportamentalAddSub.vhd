----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2020 16:14:41
-- Design Name: 
-- Module Name: ComportamentalAddSub - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ComportamentalAddSub is generic (N : integer ); --:= 4 );
 Port (a_i : in STD_LOGIC_VECTOR(N-1 downto 0);
         b_ini : in STD_LOGIC_VECTOR(N-1 downto 0);
         op_i : in STD_LOGIC;
         c_out : out STD_LOGIC;
         v_o : out STD_LOGIC;
         s_o : out STD_LOGIC_VECTOR(N-1 downto 0));
end ComportamentalAddSub;

architecture Dataflow of ComportamentalAddSub is

    -- auxiliaru signals to compute intermmediate results
    signal  add_op, sub_op : STD_LOGIC_VECTOR (N downto 0);
    
begin


    -- increment
    add_op <= std_logic_vector(unsigned("0"&a_i) + unsigned("0"&b_ini));      -- add
    sub_op <= std_logic_vector(signed("0"&a_i) - signed("0"&b_ini));      -- substract
    
    c_out <= add_op(N);         
    v_o <= sub_op(N);                          
    
--    c_out <= '1';         
--    v_o <= '1';     
    
    -- output depends on the selected operation code
    with op_i select
    s_o <=  add_op(N-1 downto 1) when '0',      -- add
            sub_op(N-1 downto 1) when '1',      -- substract
            "0000"  when others;       

end Dataflow;