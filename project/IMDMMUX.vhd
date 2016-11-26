----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:42:47 11/26/2016 
-- Design Name: 
-- Module Name:    IMDMMUX - Behavioral 
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

entity IMDMMUX is
    Port ( IMOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           DMOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           S : in  STD_LOGIC;
           DataOUT : out  STD_LOGIC_VECTOR (15 downto 0));
end IMDMMUX;

architecture Behavioral of IMDMMUX is

begin
	process(IMOUT, DMOUT, S)
	begin
		case S is
			when '0' => DataOUT <= DMOUT;
			when '1' => DataOUT <= IMOUT;
			when others => DataOUT <= "0000000000000000";
		end case;
	end process;

end Behavioral;

