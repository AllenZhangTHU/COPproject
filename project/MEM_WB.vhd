----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:35 11/20/2016 
-- Design Name: 
-- Module Name:    MEM_WB - Behavioral 
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

entity MEM_WB is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           enable : in  STD_LOGIC;

           
           MEM_MEMOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           MEM_Rd : in  STD_LOGIC_VECTOR (3 downto 0);
           MEM_regWE : in  STD_LOGIC;

           WB_MEMOUT : out  STD_LOGIC_VECTOR (15 downto 0);
           WB_Rd : out  STD_LOGIC_VECTOR (3 downto 0);
           WB_regWE : out  STD_LOGIC);
end MEM_WB;

architecture Behavioral of MEM_WB is
begin
	process(clk, rst)
	begin
		if (rst = '0') then
			WB_regWE <= '0';
		else
			if (clk'event and clk = '1') then
        if (enable = '1') then 
          WB_MEMOUT <= MEM_MEMOUT;
  				WB_Rd <= MEM_Rd;
  				WB_regWE <= MEM_regWE;
        end if;
			end if;
		end if;
	end process;

end Behavioral;

