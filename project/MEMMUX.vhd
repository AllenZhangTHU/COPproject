----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:38:55 11/21/2016 
-- Design Name: 
-- Module Name:    MEMMUX - Behavioral 
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

entity MEMMUX is
    Port ( ALUOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           DataOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           ACCMEM : in  STD_LOGIC;
           MEMOUT : out  STD_LOGIC_VECTOR (15 downto 0));
end MEMMUX;

architecture Behavioral of MEMMUX is

begin
	process (ALUOUT, DataOUT, ACCMEM)
	begin
		case ACCMEM is
			when '0' => MEMOUT <= ALUOUT;
			when '1' => MEMOUT <= DataOUT;
			when others => MEMOUT <= "0000000000000000";
		end case;
	end process;

end Behavioral;

