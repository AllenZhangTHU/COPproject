----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:22:35 11/21/2016 
-- Design Name: 
-- Module Name:    UART - Behavioral 
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
-- any Xilinx prAdderitives in this code.
--library UNISAdder;
--use UNISAdder.VComponents.all;

entity UART is
    Port (
	CLK : in  STD_LOGIC;
	ACCMEM : in  STD_LOGIC;
	MEM_WE : in  STD_LOGIC;
	RAM1OE : out  STD_LOGIC;
        RAM1WE : out  STD_LOGIC;
        RAM1EN : out  STD_LOGIC;
        data_ready : in  STD_LOGIC;
        rdn : out  STD_LOGIC;
        wrn : out  STD_LOGIC;
        tbre : in  STD_LOGIC;
        tsre : in  STD_LOGIC;
	RAM1Data : inout  STD_LOGIC_VECTOR (15 downto 0));
end UART;

architecture Behavioral of UART is
	signal state_in : integer range 0 to 3 := 0;
	signal state_out : integer range 0 to 5 := 0;
begin
	process(CLK)
	begin
		if (CLK'EVENT) and (CLK = '1') then
			if (MEM_WE = '1') and (ACCMEM = '0') then
			case state_in is
				when 0 => 
					state_in <= 1;
					rdn <= '1';
					RAM1OE <= '1';
					RAM1WE <= '1';
					RAM1EN <= '1';
					RAM1Data <= (others => 'Z');
				when 1 => 
					rdn <= '1';
					if (data_ready = '1') then
						state_in <= 2;
					end if;
				when 2 => 
					state_in <= 3;
					rdn <= '0';
				when 3 => 
					state_in <= 0;
				when others =>
					null;
			end case;		
			end if;
		
			if (MEM_WE = '0') and (ACCMEM = '1') then
			case state_out is
				when 0 => 
					state_out <= 1;
					rdn <= '1';
					wrn <= '1';
				when 1 => 
					state_out <= 2;
				when 2 => 
					state_out <= 3;
					wrn <= '0';
				when 3 => 
					state_out <= 4;
					wrn <= '1';
				when 4 =>
					if (tbre = '1') then
						state_out <= 5;
					end if;
				when 5 => 
					if (tsre = '1') then
						state_out <= 0;
					end if;
				when others =>
					null;
			end case;
		end if;
		end if;
	end process;

end Behavioral;

