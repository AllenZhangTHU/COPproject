----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:31:19 11/21/2016 
-- Design Name: 
-- Module Name:    ALUMUX2 - Behavioral 
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

entity ALUMUX2 is
    Port ( B : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           MEMOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUctrl2 : in  STD_LOGIC_VECTOR (1 downto 0);
           ALUIN2 : out  STD_LOGIC_VECTOR (15 downto 0));
end ALUMUX2;

architecture Behavioral of ALUMUX2 is

begin
	process(B, ALUOUT, MEMOUT, ALUctrl2)
	begin
		case ALUctrl2 is
			when "00" | "01" => ALUIN2 <= B;
			when "10" => ALUIN2 <= ALUOUT;
			when "11" => ALUIN2 <= MEMOUT;
			when others => ALUIN2 <= "0000000000000000";
		end case;
	end process;

end Behavioral;

