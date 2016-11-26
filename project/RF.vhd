----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:08:56 11/21/2016 
-- Design Name: 
-- Module Name:    RF - Behavioral 
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

entity RF is
    Port ( regWE : in  STD_LOGIC;
           RFctrl : in  STD_LOGIC_VECTOR (2 downto 0);
           MEMOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           Rd : in  STD_LOGIC_VECTOR (3 downto 0);
           Inst : in STD_LOGIC_VECTOR (5 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           A : out  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (15 downto 0)
			  );
end RF;

architecture Behavioral of RF is
	signal R0 : std_logic_vector (15 downto 0) := "0000000000000000";
	signal R1 : std_logic_vector (15 downto 0) := "0000000000000000";
	signal R2 : std_logic_vector (15 downto 0) := "0000000000000000";
	signal R3 : std_logic_vector (15 downto 0) := "0000000000000000";
	signal R4 : std_logic_vector (15 downto 0) := "0000000000000000";
	signal R5 : std_logic_vector (15 downto 0) := "0000000000000000";
	signal R6 : std_logic_vector (15 downto 0) := "0000000000000000";
	signal R7 : std_logic_vector (15 downto 0) := "0000000000000000";
	signal IH : std_logic_vector (15 downto 0) := "0000000000000000";
	signal SP : std_logic_vector (15 downto 0) := "0000000000000000";
	signal RA : std_logic_vector (15 downto 0) := "0000000000000000";
begin
	process(RFctrl, Inst, R0, R1, R2, R3, R4, R5, R6, R7, IH, SP, RA, regWE, MEMOUT, Rd)
	begin
		case RFctrl is
			when "000" =>
				A <= "0000000000000000";
				B <= "0000000000000000";
			when "001" =>
				if (("0" & Inst(5 downto 3)) = Rd and regWE = '1') then
					A <= MEMOUT;
				else
					case Inst(5 downto 3) is
						when "000" => A <= R0;
						when "001" => A <= R1;
						when "010" => A <= R2;
						when "011" => A <= R3;
						when "100" => A <= R4;
						when "101" => A <= R5;
						when "110" => A <= R6;
						when "111" => A <= R7;
						when others => A <= "0000000000000000";
					end case;
				end if;
				B <= "0000000000000000";
			when "010" =>
				if (("0" & Inst(5 downto 3)) = Rd and regWE = '1') then
					A <= MEMOUT;
				else
					case Inst(5 downto 3) is
						when "000" => A <= R0;
						when "001" => A <= R1;
						when "010" => A <= R2;
						when "011" => A <= R3;
						when "100" => A <= R4;
						when "101" => A <= R5;
						when "110" => A <= R6;
						when "111" => A <= R7;
						when others => A <= "0000000000000000";
					end case;
				end if;
				if (("0" & Inst(2 downto 0)) = Rd and regWE = '1') then
					B <= MEMOUT;
				else
					case Inst(2 downto 0) is
						when "000" => B <= R0;
						when "001" => B <= R1;
						when "010" => B <= R2;
						when "011" => B <= R3;
						when "100" => B <= R4;
						when "101" => B <= R5;
						when "110" => B <= R6;
						when "111" => B <= R7;
						when others => B <= "0000000000000000";
					end case;
				end if;
			when "011" =>
				if (("0" & Inst(2 downto 0)) = Rd and regWE = '1') then
					A <= MEMOUT;
				else
					case Inst(2 downto 0) is
						when "000" => A <= R0;
						when "001" => A <= R1;
						when "010" => A <= R2;
						when "011" => A <= R3;
						when "100" => A <= R4;
						when "101" => A <= R5;
						when "110" => A <= R6;
						when "111" => A <= R7;
						when others => A <= "0000000000000000";
					end case;
				end if;
				B <= "0000000000000000";
			when "100" =>
				if (Rd = "1000" and regWE = '1') then
					A <= MEMOUT;
				else
					A <= SP;
				end if;
				B <= "0000000000000000";
			when "101" =>
				if (Rd = "1010" and regWE = '1') then
					A <= MEMOUT;
				else
					A <= RA;
				end if;
				B <= "0000000000000000";
			when "110" =>
				if (Rd = "1001" and regWE = '1') then
					A <= MEMOUT;
				else
					A <= IH;
				end if;
				B <= "0000000000000000";
			when "111" =>
				if (Rd = "1000" and regWE = '1') then
					A <= MEMOUT;
				else
					A <= SP;
				end if;
				if (("0" & Inst(5 downto 3)) = Rd and regWE = '1') then
					B <= MEMOUT;
				else
					case Inst(5 downto 3) is
						when "000" => B <= R0;
						when "001" => B <= R1;
						when "010" => B <= R2;
						when "011" => B <= R3;
						when "100" => B <= R4;
						when "101" => B <= R5;
						when "110" => B <= R6;
						when "111" => B <= R7;
						when others => B <= "0000000000000000";
					end case;
				end if;
			when others =>
				A <= "0000000000000001";
				B <= "0000000000000001";
		end case;
	end process;

	process(clk, rst)
	begin
		if (clk'event and clk = '1') then
			if (regWE = '1') then
				case Rd is
					when "0000" => R0 <= MEMOUT;
					when "0001" => R1 <= MEMOUT;
					when "0010" => R2 <= MEMOUT;
					when "0011" => R3 <= MEMOUT;
					when "0100" => R4 <= MEMOUT;
					when "0101" => R5 <= MEMOUT;
					when "0110" => R6 <= MEMOUT;
					when "0111" => R7 <= MEMOUT;
					when "1000" => SP <= MEMOUT;
					when "1001" => IH <= MEMOUT;
					when "1010" => RA <= MEMOUT;
					when others => null;
				end case;
			end if;
		end if;
		if (rst = '0') then
			R0 <= "0000000000000000";
			R1 <= "0000000000000000";
			R2 <= "0000000000000000";
			R3 <= "0000000000000000";
			R4 <= "0000000000000000";
			R5 <= "0000000000000000";
			R6 <= "0000000000000000";
			R7 <= "0000000000000000";
			IH <= "0000000000000000";
			RA <= "0000000000000000";
			SP <= "0000000000000000";
		end if;
	end process;


end Behavioral;


