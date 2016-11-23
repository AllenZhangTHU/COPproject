----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:13:04 11/19/2016 
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity control is
    Port ( Inst : in  STD_LOGIC_VECTOR (15 downto 0);
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           Imm : in  STD_LOGIC_VECTOR (15 downto 0);
           T : in  STD_LOGIC;
			  NPC : in STD_LOGIC_VECTOR (15 downto 0);
           OP : out  STD_LOGIC_VECTOR (3 downto 0);
           PCctrl : out  STD_LOGIC_VECTOR (1 downto 0);
           RFctrl : out  STD_LOGIC_VECTOR (2 downto 0);
           Immctrl : out  STD_LOGIC_VECTOR (3 downto 0);
           Rs : out  STD_LOGIC_VECTOR (3 downto 0);
           Rt : out  STD_LOGIC_VECTOR (3 downto 0);
           Rd : out  STD_LOGIC_VECTOR (3 downto 0);
           AccMEM : out  STD_LOGIC;
           memWE : out  STD_LOGIC;
           regWE : out  STD_LOGIC;
           DataIN : out  STD_LOGIC_VECTOR (15 downto 0);
           ALUIN1 : out STD_LOGIC_VECTOR (15 downto 0);
           ALUIN2 : out STD_LOGIC_VECTOR (15 downto 0);
           newT : out  STD_LOGIC;
           TE : out STD_LOGIC);
end control;

architecture Behavioral of control is

begin
	process(Inst, A, B, Imm, T, NPC)
		variable tmp : STD_LOGIC_VECTOR (15 downto 0);
	begin
		case Inst(15 downto 11) is
			when "00001" => --NOP
				OP <= "1111";
				PCctrl <= "00";
				RFctrl <= "000";
				Immctrl <= "0000";
				Rs <= "1111";
				Rt <= "1111";
				Rd <= "1111";
				ALUIN1 <= A;
				ALUIN2 <= B;
				AccMEM <= '0';
				memWE <= '0';
				regWE <= '0';
				DataIN <= "0000000000000000";
				newT <= '0';
				TE <= '0';
			when "00010" => --B
				OP <= "1111";
				PCctrl <= "01";
				RFctrl <= "000";
				Immctrl <= "0011";
				Rs <= "1111";
				Rt <= "1111";
				Rd <= "1111";
				ALUIN1 <= A;
				ALUIN2 <= B;
				AccMEM <= '0';
				memWE <= '0';
				regWE <= '0';
				DataIN <= "0000000000000000";
				newT <= '0';
				TE <= '0';
			when "00100" => --BEQZ
				OP <= "1111";
				if (A="0000000000000000") then
					PCctrl <= "01";
				else
					PCctrl <= "00";
				end if;
				RFctrl <= "001";
				Immctrl <= "0001";
				Rs <= "0" & Inst(10 downto 8);
				Rt <= "1111";
				Rd <= "1111";
				ALUIN1 <= A;
				ALUIN2 <= B;
				AccMEM <= '0';
				memWE <= '0';
				regWE <= '0';
				DataIN <= "0000000000000000";
				newT <= '0';
				TE <= '0';
			when "00101" => --BNEZ
				OP <= "1111";
				if (A="0000000000000000") then
					PCctrl <= "00";
				else
					PCctrl <= "01";
				end if;
				RFctrl <= "001";
				Immctrl <= "0001";
				Rs <= "0" & Inst(10 downto 8);
				Rt <= "1111";
				Rd <= "1111";
				ALUIN1 <= A;
				ALUIN2 <= B;
				AccMEM <= '0';
				memWE <= '0';
				regWE <= '0';
				DataIN <= "0000000000000000";
				newT <= '0';
				TE <= '0';
			when "00110" => --SLL|SRA
				case Inst(1 downto 0) is
					when "00" => --SLL
						OP <= "0110";
						PCctrl <= "00";
						RFctrl <= "001";
						Immctrl <= "0111";
						Rs <= "0" & Inst(7 downto 5);
						Rt <= "1111";
						Rd <= "0" & Inst(10 downto 8);
						ALUIN1 <= A;
						ALUIN2 <= Imm;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '1';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
					when "11" => --SRA
						OP <= "1000";
						PCctrl <= "00";
						RFctrl <= "001";
						Immctrl <= "0111";
						Rs <= "0" & Inst(7 downto 5);
						Rt <= "1111";
						Rd <= "0" & Inst(10 downto 8);
						ALUIN1 <= A;
						ALUIN2 <= Imm;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '1';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
					when others =>
						OP <= "1111";
						PCctrl <= "00";
						RFctrl <= "000";
						Immctrl <= "0000";
						Rs <= "1111";
						Rt <= "1111";
						Rd <= "1111";
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '0';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
				end case;
			when "01000" => --ADDIU3
				OP <= "0000";
				PCctrl <= "00";
				RFctrl <= "001";
				Immctrl <= "0010";
				Rs <= "0" & Inst(10 downto 8);
				Rt <= "1111";
				Rd <= "0" & Inst(7 downto 5);
				ALUIN1 <= A;
				ALUIN2 <= Imm;
				AccMEM <= '0';
				memWE <= '0';
				regWE <= '1';
				DataIN <= "0000000000000000";
				newT <= '0';
				TE <= '0';
			when "01001" => --ADDIU
				OP <= "0000";
				PCctrl <= "00";
				RFctrl <= "001";
				Immctrl <= "0001";
				Rs <= "0" & Inst(10 downto 8);
				Rt <= "1111";
				Rd <= "0" & Inst(10 downto 8);
				ALUIN1 <= A;
				ALUIN2 <= Imm;
				AccMEM <= '0';
				memWE <= '0';
				regWE <= '1';
				DataIN <= "0000000000000000";
				newT <= '0';
				TE <= '0';
			when "01010" => --SLTI
				OP <= "1111";
				tmp := A - Imm;
				newT <= tmp(15);
				PCctrl <= "00";
				RFctrl <= "001";
				Immctrl <= "0001";
				Rs <= "0" & Inst(10 downto 8);
				Rt <= "1111";
				Rd <= "1111";
				ALUIN1 <= A;
				ALUIN2 <= B;
				AccMEM <= '0';
				memWE <= '0';
				regWE <= '0';
				DataIN <= "0000000000000000";
				TE <= '1';
			when "01100" => --ADDSP|BTEQZ|MTSP
				case Inst(10 downto 8) is
					when "011" => --ADDSP
						OP <= "0000";
						PCctrl <= "00";
						RFctrl <= "100";
						Immctrl <= "0001";
						Rs <= "1000";
						Rt <= "1111";
						Rd <= "1000";
						ALUIN1 <= A;
						ALUIN2 <= Imm;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '1';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
					when "000" => --BTEQZ
						OP <= "1111";
						if (T='0') then
							PCctrl <= "01";
						else
							PCctrl <= "00";
						end if;
						RFctrl <= "000";
						Immctrl <= "0001";
						Rs <= "1111";
						Rt <= "1111";
						Rd <= "1111";
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '0';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
					when "100" => --MTSP
						OP <= "1010";
						PCctrl <= "00";
						RFctrl <= "011";
						Immctrl <= "0000";
						Rs <= "0" & Inst(7 downto 5);
						Rt <= "1111";
						Rd <= "1000";
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '1';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
					when others =>
						OP <= "1111";
						PCctrl <= "00";
						RFctrl <= "000";
						Immctrl <= "0000";
						Rs <= "1111";
						Rt <= "1111";
						Rd <= "1111";
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '0';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
				end case;
			when "01101" => --LI
				OP <= "1011";
				PCctrl <= "00";
				RFctrl <= "000";
				Immctrl <= "0100";
				Rs <= "1111";
				Rt <= "1111";
				Rd <= "0" & Inst(10 downto 8);
				ALUIN1 <= A;
				ALUIN2 <= Imm;
				AccMEM <= '0';
				memWE <= '0';
				regWE <= '1';
				DataIN <= "0000000000000000";
				newT <= '0';
				TE <= '0';
			when "01111" => --MOVE
				OP <= "1010";
				PCctrl <= "00";
				RFctrl <= "011";
				Immctrl <= "0000";
				Rs <= "0" & Inst(7 downto 5);
				Rt <= "1111";
				Rd <= "0" & Inst(10 downto 8);
				ALUIN1 <= A;
				ALUIN2 <= B;
				AccMEM <= '0';
				memWE <= '0';
				regWE <= '1';
				DataIN <= "0000000000000000";
				newT <= '0';
				TE <= '0';
			when "10010" => --LW_SP
				OP <= "0000";
				PCctrl <= "00";
				RFctrl <= "100";
				Immctrl <= "0001";
				Rs <= "1000";
				Rt <= "1111";
				Rd <= "0" & Inst(10 downto 8);
				ALUIN1 <= A;
				ALUIN2 <= Imm;
				AccMEM <= '1';
				memWE <= '0';
				regWE <= '1';
				DataIN <= "0000000000000000";
				newT <= '0';
				TE <= '0';
			when "10011" => --LW
				OP <= "0000";
				PCctrl <= "00";
				RFctrl <= "001";
				Immctrl <= "0101";
				Rs <= "0" & Inst(10 downto 8);
				Rt <= "1111";
				Rd <= "0" & Inst(7 downto 5);
				ALUIN1 <= A;
				ALUIN2 <= Imm;
				AccMEM <= '1';
				memWE <= '0';
				regWE <= '1';
				DataIN <= "0000000000000000";
				newT <= '0';
				TE <= '0';
			when "11010" => --SW_SP
				OP <= "0000";
				PCctrl <= "00";
				RFctrl <= "111";
				Immctrl <= "0001";
				Rs <= "1000";
				Rt <= "0" & Inst(10 downto 8);
				Rd <= "1111";
				ALUIN1 <= A;
				ALUIN2 <= Imm;
				AccMEM <= '0';
				memWE <= '1';
				regWE <= '0';
				DataIN <= B;
				newT <= '0';
				TE <= '0';
			when "11011" => --SW
				OP <= "0000";
				PCctrl <= "00";
				RFctrl <= "010";
				Immctrl <= "0101";
				Rs <= "0" & Inst(10 downto 8);
				Rt <= "0" & Inst(7 downto 5);
				Rd <= "1111";
				ALUIN1 <= A;
				ALUIN2 <= Imm;
				AccMEM <= '0';
				memWE <= '1';
				regWE <= '0';
				DataIN <= B;
				newT <= '0';
				TE <= '0';
			when "11100" => --ADDU|SUBU
				case Inst(1 downto 0) is
					when "01" => --ADDU
						OP <= "0000";
						PCctrl <= "00";
						RFctrl <= "010";
						Immctrl <= "0000";
						Rs <= "0" & Inst(10 downto 8);
						Rt <= "0" & Inst(7 downto 5);
						Rd <= "0" & Inst(4 downto 2);
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '1';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
					when "11" => --SUBU
						OP <= "0001";
						PCctrl <= "00";
						RFctrl <= "010";
						Immctrl <= "0000";
						Rs <= "0" & Inst(10 downto 8);
						Rt <= "0" & Inst(7 downto 5);
						Rd <= "0" & Inst(4 downto 2);
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '1';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
					when others =>
						OP <= "1111";
						PCctrl <= "00";
						RFctrl <= "000";
						Immctrl <= "0000";
						Rs <= "1111";
						Rt <= "1111";
						Rd <= "1111";
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '0';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
				end case;
			when "11101" => --AND|CMP|JR|JALR|JRRA|MFPC|NOT|OR
				case Inst(4 downto 0) is
					when "01100" => --AND
						OP <= "0010";
						PCctrl <= "00";
						RFctrl <= "010";
						Immctrl <= "0000";
						Rs <= "0" & Inst(10 downto 8);
						Rt <= "0" & Inst(7 downto 5);
						Rd <= "0" & Inst(10 downto 8);
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '1';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
					when "01010" => --CMP
						OP <= "1111";
						if (A=B) then
							newT <= '0';
						else
							newT <= '1';
						end if;
						PCctrl <= "00";
						RFctrl <= "010";
						Immctrl <= "0000";
						Rs <= "0" & Inst(10 downto 8);
						Rt <= "0" & Inst(7 downto 5);
						Rd <= "1111";
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '0';
						DataIN <= "0000000000000000";
						TE <= '1';
					when "00000" => --JR|JALR|JRRA|MFPC
						case Inst(7 downto 5) is
							when "000" => --JR
								OP <= "1111";
								PCctrl <= "11";
								RFctrl <= "001";
								Immctrl <= "0000";
								Rs <= "0" & Inst(10 downto 8);
								Rt <= "1111";
								Rd <= "1111";
								ALUIN1 <= A;
								ALUIN2 <= B;
								AccMEM <= '0';
								memWE <= '0';
								regWE <= '0';
								DataIN <= "0000000000000000";
								newT <= '0';
								TE <= '0';
							when "110" => --JALR
								OP <= "0000";
								PCctrl <= "11";
								RFctrl <= "001";
								Immctrl <= "1000";
								Rs <= "0" & Inst(10 downto 8);
								Rt <= "1111";
								Rd <= "1010";
								ALUIN1 <= NPC;
								ALUIN2 <= Imm;
								AccMEM <= '0';
								memWE <= '0';
								regWE <= '1';
								DataIN <= "0000000000000000";
								newT <= '0';
								TE <= '0';
							when "001" => --JRRA
								OP <= "1111";
								PCctrl <= "11";
								RFctrl <= "101";
								Immctrl <= "0000";
								Rs <= "1010";
								Rt <= "1111";
								Rd <= "1111";
								ALUIN1 <= A;
								ALUIN2 <= B;
								AccMEM <= '0';
								memWE <= '0';
								regWE <= '0';
								DataIN <= "0000000000000000";
								newT <= '0';
								TE <= '0';
							when "010" => --MFPC
								OP <= "0001";
								PCctrl <= "00";
								RFctrl <= "000";
								Immctrl <= "1000";
								Rs <= "1111";
								Rt <= "1111";
								Rd <= "0" & Inst(10 downto 8);
								ALUIN1 <= NPC;
								ALUIN2 <= Imm;
								AccMEM <= '0';
								memWE <= '0';
								regWE <= '1';
								DataIN <= "0000000000000000";
								newT <= '0';
								TE <= '0';
							when others =>
								OP <= "1111";
								PCctrl <= "00";
								RFctrl <= "000";
								Immctrl <= "0000";
								Rs <= "1111";
								Rt <= "1111";
								Rd <= "1111";
								ALUIN1 <= A;
								ALUIN2 <= B;
								AccMEM <= '0';
								memWE <= '0';
								regWE <= '0';
								DataIN <= "0000000000000000";
								newT <= '0';
								TE <= '0';
						end case;
					when "01111" => --NOT
						OP <= "0101";
						PCctrl <= "00";
						RFctrl <= "011";
						Immctrl <= "0000";
						Rs <= "0" & Inst(7 downto 5);
						Rt <= "1111";
						Rd <= "0" & Inst(10 downto 8);
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '1';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
					when "01101" => --OR
						OP <= "0011";
						PCctrl <= "00";
						RFctrl <= "010";
						Immctrl <= "0000";
						Rs <= "0" & Inst(10 downto 8);
						Rt <= "0" & Inst(7 downto 5);
						Rd <= "0" & Inst(10 downto 8);
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '1';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
					when others =>
						OP <= "1111";
						PCctrl <= "00";
						RFctrl <= "000";
						Immctrl <= "0000";
						Rs <= "1111";
						Rt <= "1111";
						Rd <= "1111";
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '0';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
				end case;
			when "11110" => --MFIH|MTIH
				case Inst(0) is
					when '0' => --MFIH
						OP <= "1010";
						PCctrl <= "00";
						RFctrl <= "110";
						Immctrl <= "0000";
						Rs <= "1001";
						Rt <= "1111";
						Rd <= "0" & Inst(10 downto 8);
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '1';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
					when '1' => --MTIH
						OP <= "1010";
						PCctrl <= "00";
						RFctrl <= "001";
						Immctrl <= "0000";
						Rs <= "0" & Inst(10 downto 8);
						Rt <= "1111";
						Rd <= "1001";
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '1';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
					when others =>
						OP <= "1111";
						PCctrl <= "00";
						RFctrl <= "000";
						Immctrl <= "0000";
						Rs <= "1111";
						Rt <= "1111";
						Rd <= "1111";
						ALUIN1 <= A;
						ALUIN2 <= B;
						AccMEM <= '0';
						memWE <= '0';
						regWE <= '0';
						DataIN <= "0000000000000000";
						newT <= '0';
						TE <= '0';
				end case;
			when others =>
				OP <= "1111";
				PCctrl <= "00";
				RFctrl <= "000";
				Immctrl <= "0000";
				Rs <= "1111";
				Rt <= "1111";
				Rd <= "1111";
				ALUIN1 <= A;
				ALUIN2 <= B;
				AccMEM <= '0';
				memWE <= '0';
				regWE <= '0';
				DataIN <= "0000000000000000";
				newT <= '0';
				TE <= '0';
		end case;
	end process;
				

end Behavioral;

