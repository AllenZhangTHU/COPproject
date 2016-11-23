----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:34:57 11/21/2016 
-- Design Name: 
-- Module Name:    PCMUX - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PCMUX is
    Port ( NPC : in  STD_LOGIC_VECTOR (15 downto 0);
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           adderOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           PCctrl : in  STD_LOGIC_VECTOR (1 downto 0);
           PCIN : out  STD_LOGIC_VECTOR (15 downto 0));
end PCMUX;

architecture Behavioral of PCMUX is

begin
	process(NPC, A, adderOUT, PCctrl)
	begin
		case PCctrl is
			when "00" | "01" => PCIN <= NPC;
			when "10" => PCIN <= A;
			when "11" => PCIN <= adderOUT;
			when others => PCIN <= "0000000000000000";
		end case;
	end process;

end Behavioral;

