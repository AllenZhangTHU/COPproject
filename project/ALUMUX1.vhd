----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:25:14 11/21/2016 
-- Design Name: 
-- Module Name:    ALUMUX1 - Behavioral 
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

entity ALUMUX1 is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           MEMOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUctrl1 : in  STD_LOGIC_VECTOR (1 downto 0);
           ALUIN1 : out  STD_LOGIC_VECTOR (15 downto 0));
end ALUMUX1;

architecture Behavioral of ALUMUX1 is

begin
	process(A, ALUOUT, MEMOUT, ALUctrl1)
	begin
		case ALUctrl1 is
			when "00" | "01" => ALUIN1 <= A;
			when "10" => ALUIN1 <= ALUOUT;
			when "11" => ALUIN1 <= MEMOUT;
			when others => ALUIN1 <= "0000000000000000";
		end case;
	end process;

end Behavioral;

