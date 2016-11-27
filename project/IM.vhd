----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:35 11/20/2016 
-- Design Name: 
-- Module Name:    IM - Behavioral 
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

entity IM is
    Port ( PC : in  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Ram2OE : out  STD_LOGIC;
           Ram2WE : out  STD_LOGIC;
           Ram2EN : out  STD_LOGIC;
           Ram2Addr : out  STD_LOGIC_VECTOR (17 downto 0);
           Ram2Data : inout  STD_LOGIC_VECTOR (15 downto 0);
           Inst : out STD_LOGIC_VECTOR (15 downto 0);
			  MEM_RAM2: in  STD_LOGIC;
			  MEM_ACCMEM: in  STD_LOGIC;
			  MEM_MEMWE: in  STD_LOGIC;
			  MEM_ALUOUT:in  STD_LOGIC_VECTOR (15 downto 0);
			  MEM_DATAIN: in  STD_LOGIC_VECTOR (15 downto 0));
end IM;

architecture Behavioral of IM is
	signal savedPC : std_logic_vector (15 downto 0) := "1111111111111111";
	signal state : std_logic := '0';
begin
	
	Ram2Addr(17 downto 16) <= "00";
	process(clk, rst)
	begin
		if (clk'event and clk = '0') then
			if (MEM_RAM2 = '0') then 
				if (state='0') then
					if (PC /= savedPC) then
						savedPC <= PC;
						Ram2OE <= '0';
						Ram2WE <= '1';
						Ram2EN <= '0';
						Ram2Addr(15 downto 0) <= PC;
						Ram2Data <= "ZZZZZZZZZZZZZZZZ";
						state <= '1';
					else
						Ram2OE <= '1';
						Ram2EN <= '1';
						Ram2Addr(15 downto 0) <= PC;
						Ram2Data <= "ZZZZZZZZZZZZZZZZ";
					end if;
				else
					
					state <= '0';
				end if;
			end if;
			if (MEM_RAM2 = '1')and(MEM_ACCMEM='1') then
				case state is
					when '0' => 	
									Ram2EN <= '0';
									Ram2WE <= '1';
									Ram2OE <= '0';
									RAM2Data <=  "ZZZZZZZZZZZZZZZZ";
									RAM2Addr(15 downto 0) <= MEM_ALUOUT;
									state <= '1';
					when '1' => 	
									state <= '0';
					when others => null;
				end case;
			end if;
			if (MEM_RAM2 = '1')and(MEM_ACCMEM='0') then
				case state is
					when '0'=> 	
									Ram2EN <= '0';
									Ram2OE <= '1';
									Ram2WE <= '1';
									RAM2Addr(15 downto 0) <= MEM_ALUOUT;
									RAM2Data <= MEM_DATAIN;
									state <= '1';
					when '1' => 	Ram2WE <= '0';
									state <= '0';
					when others => null;
				end case;
			end if;
		end if;--edge
		if (rst = '0') then
			state <= '0';
			savedPC <= "1111111111111111";
			Ram2EN <= '1';
			Ram2OE <= '1';
			Ram2WE <= '1';
		end if;
	end process;
	process (Ram2data)
	begin
		Inst <= Ram2Data;
	end process;
end Behavioral;

