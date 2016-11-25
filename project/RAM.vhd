----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:59:33 11/03/2016 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port (
	CLK : in  STD_LOGIC;
	ACCMEM : in  STD_LOGIC;
	MEM_WE : in  STD_LOGIC;
	addr : inout  STD_LOGIC_VECTOR (15 downto 0);
	data : inout  STD_LOGIC_VECTOR (15 downto 0);
	Ram1Addr : out  STD_LOGIC_VECTOR (17 downto 0);
	Ram1Data : inout  STD_LOGIC_VECTOR (15 downto 0);
	Ram1OE : out  STD_LOGIC;
	Ram1WE : out  STD_LOGIC;
	Ram1EN : out  STD_LOGIC;
	wrn : out STD_LOGIC;
	rdn : out STD_LOGIC); 
end RAM;

architecture Behavioral of RAM is
	signal state1 : integer range 0 to 3 := 0;
	signal state2 : integer range 0 to 10 := 0;
begin
	wrn <= '1';
	rdn <= '1';
	Ram1Addr(17 downto 16) <= "00";	
	process(CLK)
	begin
		if (MEM_WE = '0') and (ACCMEM = '1') then
		if (CLK'EVENT) and (CLK = '1') then
			case state1 is
				when 0 =>
					state1 <= 1;
					Ram1EN <= '1';
				when 1 =>
					state1 <= 2;
					Ram1EN <= '0';
					Ram1OE <= '1';
					Ram1WE <= '1';
				when 2 =>
					state1 <= 3;
					RAM1Addr(15 downto 0) <= addr;
					RAM1Data <= data;
					Ram1WE <= '1';
				when 3 =>
					Ram1WE <= '0';
					state1 <= 0;
				when others =>
					null;
			end case;		
		end if;
		end if;
	end process;

	process(CLK)
	begin
		if (MEM_WE = '1') and (ACCMEM = '0') then
		if (CLK'EVENT) and (CLK = '1') then
			case state2 is
				when 0 =>
					state2 <= 1;
					Ram1EN <= '0';
					Ram1OE <= '0';
					Ram1WE <= '1';
				when 1 =>
					state2 <= 2;
					RAM1Data <= "ZZZZZZZZZZZZZZZZ";
				when 2 =>
					state2 <= 3;
					RAM1Addr(15 downto 0) <= addr;
				when 3 =>
					data <= Ram1Data;
					state2 <= 0;
				when others =>
					null;
			end case;		
		end if;
		end if;
	end process;
	
end Behavioral;

