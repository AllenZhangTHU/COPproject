----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:23:21 11/20/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( OP : in  STD_LOGIC_VECTOR (3 downto 0);
           ALUIN1 : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUIN2 : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOUT : out  STD_LOGIC_VECTOR (15 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
	process(OP, ALUIN1, ALUIN2)
	variable num : integer range 0 to 15;
	begin
		case OP is
			when "0000" => ALUOUT <= ALUIN1 + ALUIN2;
			when "0001" => ALUOUT <= ALUIN1 - ALUIN2;
			when "0010" => ALUOUT <= ALUIN1 and ALUIN2;
			when "0011" => ALUOUT <= ALUIN1 or ALUIN2;
			when "0100" => ALUOUT <= ALUIN1 xor ALUIN2;
			when "0101" => ALUOUT <= not ALUIN1;
			when "0110" => ALUOUT <= to_stdlogicvector(to_bitvector(ALUIN1) sll conv_integer(ALUIN2));
			when "0111" => ALUOUT <= to_stdlogicvector(to_bitvector(ALUIN1) srl conv_integer(ALUIN2));
			when "1000" =>
				num := conv_integer(ALUIN2);
				ALUOUT <= SXT(ALUIN1(15 downto num), ALUOUT'length);
			when "1001" => ALUOUT <= to_stdlogicvector(to_bitvector(ALUIN1) rol conv_integer(ALUIN2));
			when "1010" => ALUOUT <= ALUIN1;
			when "1011" => ALUOUT <= ALUIN2;
			when others => ALUOUT <= "1111111111111111";
		end case;
	end process;

end Behavioral;

