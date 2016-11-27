----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:35 11/20/2016 
-- Design Name: 
-- Module Name:    EXE_MEM - Behavioral 
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

entity EXE_MEM is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           
           EXE_ALUOUT : in  STD_LOGIC_VECTOR (15 downto 0);
           EXE_Rd : in  STD_LOGIC_VECTOR (3 downto 0);
           EXE_AccMEM : in  STD_LOGIC;
           EXE_memWE : in  STD_LOGIC;
           EXE_regWE : in  STD_LOGIC;
           EXE_DataIN : in  STD_LOGIC_VECTOR (15 downto 0);
			  EXE_S : in STD_LOGIC;

           MEM_ALUOUT : out  STD_LOGIC_VECTOR (15 downto 0);
           MEM_Rd : out  STD_LOGIC_VECTOR (3 downto 0);
           MEM_AccMEM : out  STD_LOGIC;
           MEM_memWE : out  STD_LOGIC;
           MEM_regWE : out  STD_LOGIC;
           MEM_DataIN : out  STD_LOGIC_VECTOR (15 downto 0);
			  MEM_S : out STD_LOGIC
           );
end EXE_MEM;

architecture Behavioral of EXE_MEM is
  signal S : STD_LOGIC := '0';
begin
  MEM_S <= S;
  process(clk, rst)
  begin
    if (rst = '0') then
      MEM_AccMEM <= '0';
      MEM_memWE <= '0';
      MEM_regWE <= '0';
		S <= '0';
    else
      if (clk'event and clk = '1') then
        if (enable = '1') then
          MEM_ALUOUT <= EXE_ALUOUT;
          MEM_Rd <= EXE_Rd;
          MEM_AccMEM <= EXE_AccMEM;
          MEM_memWE <= EXE_memWE;
          MEM_regWE <= EXE_regWE;
          MEM_DataIN <= EXE_DataIN;
			 S <= EXE_S;
        end if;
		  if (S = '1') then
			 MEM_AccMEM <= '0';
			 MEM_memWE <= '0';
			 MEM_regWE <= '0';
			 S <= '0';
		  end if;
      end if;
    end if;
  end process;

end Behavioral;

