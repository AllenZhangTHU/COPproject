----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:35:54 11/26/2016 
-- Design Name: 
-- Module Name:    InstAddrMux - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstAddrMux is
    Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           S : in  STD_LOGIC;
           IMIN : out  STD_LOGIC_VECTOR (15 downto 0));
end InstAddrMux;

architecture Behavioral of InstAddrMux is

begin
	process(PC, ALUOUT, S)
	begin
		case S is
			when '0' => IMIN <= PC;
			when '1' => IMIN <= ALUOUT;
			when others => IMIN <= "0000100000000000";
		end case;
	end process;

end Behavioral;

