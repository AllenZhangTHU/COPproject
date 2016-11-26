----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:23:21 11/20/2016 
-- Design Name: 
-- Module Name:    Forwarding - Behavioral 
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

entity Forwarding is
		Port ( ID_Rs : in  STD_LOGIC_VECTOR (3 downto 0);
					 ID_Rt : in  STD_LOGIC_VECTOR (3 downto 0);
					 ID_EXE_Rd : in  STD_LOGIC_VECTOR (3 downto 0);
					 ID_EXE_regWE : in  STD_LOGIC;
					 ID_EXE_AccMEM : in  STD_LOGIC;
					 EXE_MEM_Rd : in  STD_LOGIC_VECTOR (3 downto 0);
					 EXE_MEM_regWE : in  STD_LOGIC;
					 PCReg_enable : out STD_LOGIC;
					 IF_ID_enable : out STD_LOGIC;
					 ID_EXE_enable : out STD_LOGIC;
					 ID_EXE_bubble : out STD_LOGIC;
					 ALUctrl1 : out STD_LOGIC_VECTOR (1 downto 0);
					 ALUctrl2 : out STD_LOGIC_VECTOR (1 downto 0)
					 );
end Forwarding;

architecture Behavioral of Forwarding is

begin
	process(ID_Rs,ID_Rt,ID_EXE_Rd,ID_EXE_regWE,ID_EXE_AccMEM,EXE_MEM_Rd,EXE_MEM_regWE)
	begin
	    if (((ID_EXE_AccMEM = '1') and (ID_EXE_regWE = '1')) and ((ID_Rs = ID_EXE_Rd) or (ID_Rt = ID_EXE_Rd))) then
			PCReg_enable <= '0';
			IF_ID_enable <= '0';
			ID_EXE_enable <= '0';
			ID_EXE_bubble <= '1';
		else
			PCReg_enable <= '1';
			IF_ID_enable <= '1';
			ID_EXE_enable <= '1';
			ID_EXE_bubble <= '0';
		end if;

		if ((ID_Rs = ID_EXE_Rd)  and ID_EXE_regWE = '1') then
			ALUctrl1 <= "10";
		else
			if ((ID_Rs = EXE_MEM_Rd) and EXE_MEM_regWE = '1') then
				ALUctrl1 <= "11";
			else
				ALUCtrl1 <= "00";
			end if;
		end if;
		
		if ((ID_Rt = ID_EXE_Rd)  and ID_EXE_regWE = '1') then
			ALUctrl2 <= "10";
		else
			if ((ID_Rt = EXE_MEM_Rd) and EXE_MEM_regWE = '1') then
				ALUctrl2 <= "11";
			else
				ALUCtrl2 <= "00";
			end if;
		end if;
	end process;
end Behavioral;

















