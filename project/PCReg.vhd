----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:35 11/20/2016 
-- Design Name: 
-- Module Name:    PCReg - Behavioral 
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

entity PCReg is
		Port ( clk : in  STD_LOGIC;
					 rst : in  STD_LOGIC;
					 enable : in  STD_LOGIC;

					 NPC : in  STD_LOGIC_VECTOR (15 downto 0);

					 PC : out  STD_LOGIC_VECTOR (15 downto 0));
end PCReg;

architecture Behavioral of PCReg is
begin
	process(clk, rst)
	begin
		if (rst = '0') then
			PC <= "0000000000000000";
		else
			if (clk'event and clk = '1') then
				if (enable = '1') then
					PC <= NPC;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

