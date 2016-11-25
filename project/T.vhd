----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:22:35 11/21/2016 
-- Design Name: 
-- Module Name:    T - Behavioral 
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
--library UNISAdder;
--use UNISAdder.VComponents.all;

entity T is
    Port (
	 clk : in STD_LOGIC;
	 rst : in STD_LOGIC;
	 enable : in STD_LOGIC;
	 T_in : in  STD_LOGIC;
	 T_reg : out  STD_LOGIC);
end T;

architecture Behavioral of T is
begin
	process(clk, rst)
	begin
		if (rst = '0') then
			T_reg <= '0';
		else
			if (clk'event and clk = '1') then
				if (enable = '1') then
					T_reg <= T_in;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

