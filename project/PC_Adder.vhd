----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:22:35 11/21/2016 
-- Design Name: 
-- Module Name:    PC_Adder - Behavioral 
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
-- any Xilinx prAdderitives in this code.
--library UNISAdder;
--use UNISAdder.VComponents.all;

entity PC_Adder is
    Port (
	PC : in  STD_LOGIC_VECTOR(15 downto 0);
	NPC : out  STD_LOGIC_VECTOR(15 downto 0));
end PC_Adder;

architecture Behavioral of PC_Adder is
begin
	process(PC)
	begin
		NPC <= PC + '1';
	end process;

end Behavioral;

