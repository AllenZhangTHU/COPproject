----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:35 11/20/2016 
-- Design Name: 
-- Module Name:    IF_ID - Behavioral 
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

entity IF_ID is
	Port ( clk : in  STD_LOGIC;
			 rst : in  STD_LOGIC;
			 enable : in  STD_LOGIC;

			 IF_Inst : in  STD_LOGIC_VECTOR (15 downto 0);
			 IF_NPC  :in STD_LOGIC_VECTOR(15 DOWNTO 0);

			 ID_Inst : out  STD_LOGIC_VECTOR (15 downto 0);
			 ID_NPC  :out STD_LOGIC_VECTOR(15 DOWNTO 0)
			 );
end IF_ID;

architecture Behavioral of IF_ID is
begin
	process(clk, rst)
	begin
	if (rst = '0') then
		ID_Inst <= "0000100000000000";
		ID_NPC <= "0000000000000000";
	else
		if (clk'event and clk = '1') then
			if (enable = '1')then
				ID_Inst <= IF_Inst;
				ID_NPC <= IF_NPC;
			end if;
		end if;
	end if;
	end process;

end Behavioral;

