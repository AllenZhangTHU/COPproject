----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:39:15 11/26/2016 
-- Design Name: 
-- Module Name:    IMWEproducer - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IMWEproducer is
    Port ( S : in  STD_LOGIC;
           MEMWE : in  STD_LOGIC;
           IMWE : out  STD_LOGIC);
end IMWEproducer;

architecture Behavioral of IMWEproducer is

begin
	process(S, MEMWE)
	begin
		IMWE <= S and MEMWE;
	end process;

end Behavioral;

