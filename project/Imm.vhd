----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:28 11/20/2016 
-- Design Name: 
-- Module Name:    Imm - Behavioral 
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

entity Imm is
    Port ( Immctrl : in  STD_LOGIC_VECTOR (3 downto 0);
           Inst : in  STD_LOGIC_VECTOR (15 downto 0);
           Imm : out  STD_LOGIC_VECTOR (15 downto 0));
end Imm;

architecture Behavioral of Imm is

begin
	process(Immctrl, Inst)
	begin
		case Immctrl is
			when "0001" =>
				Imm <= SXT(Inst(7 downto 0), Imm'length);
			when "0010" =>
				Imm <= SXT(Inst(3 downto 0), Imm'length);
			when "0011" =>
				Imm <= SXT(Inst(10 downto 0), Imm'length);
			when "0100" =>
				Imm <= "00000000" & Inst(7 downto 0);
			when "0101" =>
				Imm <= SXT(Inst(4 downto 0), Imm'length);
			when "0110" =>
				Imm <= "000000000000" & Inst(3 downto 0);
			when "0111" =>
				if (Inst(4 downto 2)="000") then
					Imm <= "0000000000001000";
				else
					Imm <= "0000000000000" & Inst(4 downto 2);
				end if;
			when "1000" =>
				Imm <= "0000000000000001";
			when others =>
				Imm <= "0000000000000000";
		end case;
	end process;

end Behavioral;

