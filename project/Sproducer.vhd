----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:46:39 11/26/2016 
-- Design Name: 
-- Module Name:    Sproducer - Behavioral 
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

entity Sproducer is
    Port ( ALUOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           ACCMEM : in  STD_LOGIC;
           MEMWE : in  STD_LOGIC;
           S : out  STD_LOGIC);
end Sproducer;

architecture Behavioral of Sproducer is

begin
	process(ALUOUT, ACCMEM, MEMWE)
	begin
		if (ALUOUT < "1000000000000000") then
			S <= ACCMEM or MEMWE;
		else
			S <= '0';
		end if;
	end process;

end Behavioral;

