----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:35 11/20/2016 
-- Design Name: 
-- Module Name:    ID_EXE - Behavioral 
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

entity ID_EXE is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           bubble : in STD_LOGIC;

           ID_ALUIN1 : in  STD_LOGIC_VECTOR (15 downto 0);
           ID_ALUIN2 : in  STD_LOGIC_VECTOR (15 downto 0);
           ID_OP : in  STD_LOGIC_VECTOR (3 downto 0);
           ID_Rd : in  STD_LOGIC_VECTOR (3 downto 0);
           ID_AccMEM : in  STD_LOGIC;
           ID_memWE : in  STD_LOGIC;
           ID_regWE : in  STD_LOGIC;
           ID_DataIN : in  STD_LOGIC_VECTOR (15 downto 0);

           EXE_ALUIN1 : out  STD_LOGIC_VECTOR (15 downto 0);
           EXE_ALUIN2 : out  STD_LOGIC_VECTOR (15 downto 0);
           EXE_OP : out  STD_LOGIC_VECTOR (3 downto 0);
           EXE_Rd : out  STD_LOGIC_VECTOR (3 downto 0);
           EXE_AccMEM : out  STD_LOGIC;
           EXE_memWE : out  STD_LOGIC;
           EXE_regWE : out  STD_LOGIC;
           EXE_DataIN : out  STD_LOGIC_VECTOR (15 downto 0)
           );
end ID_EXE;

architecture Behavioral of ID_EXE is
begin
	process(clk, rst)
	begin
		if (rst = '0') then
			EXE_AccMEM <= '0';
			EXE_memWE <= '0';
			EXE_regWE <= '0';
		else
			if (clk'event and clk = '1') then
				if (enable = '1') then 
					EXE_ALUIN1 <= ID_ALUIN1;
					EXE_ALUIN2 <= ID_ALUIN2;
					EXE_OP <= ID_OP;
					EXE_Rd <= ID_Rd;
					EXE_AccMEM <= ID_AccMEM;
					EXE_memWE <= ID_memWE;
					EXE_regWE <= ID_regWE;
					EXE_DataIN <= ID_DataIN;
				else
					if (bubble = '1') then
						EXE_AccMEM <= '0';
						EXE_memWE <= '0';
						EXE_regWE <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

