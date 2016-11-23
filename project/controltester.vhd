--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:31:18 11/23/2016
-- Design Name:   
-- Module Name:   Z:/Documents/COP/COPproject/project/controltester.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY controltester IS
END controltester;
 
ARCHITECTURE behavior OF controltester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control
    PORT(
         Inst : IN  std_logic_vector(15 downto 0);
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Imm : IN  std_logic_vector(15 downto 0);
         T : IN  std_logic;
         OP : OUT  std_logic_vector(3 downto 0);
         Wctrl : OUT  std_logic_vector(3 downto 0);
         PCctrl : OUT  std_logic_vector(1 downto 0);
         RFctrl : OUT  std_logic_vector(2 downto 0);
         Immctrl : OUT  std_logic_vector(3 downto 0);
         Rs : OUT  std_logic_vector(3 downto 0);
         Rt : OUT  std_logic_vector(3 downto 0);
         Rd : OUT  std_logic_vector(3 downto 0);
         ctrl1 : OUT  std_logic;
         ctrl2 : OUT  std_logic;
         AccMEM : OUT  std_logic;
         memWE : OUT  std_logic;
         regWE : OUT  std_logic;
         DataIN : OUT  std_logic_vector(15 downto 0);
         newT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Inst : std_logic_vector(15 downto 0) := (others => '0');
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal Imm : std_logic_vector(15 downto 0) := (others => '0');
   signal T : std_logic := '0';

 	--Outputs
   signal OP : std_logic_vector(3 downto 0);
   signal Wctrl : std_logic_vector(3 downto 0);
   signal PCctrl : std_logic_vector(1 downto 0);
   signal RFctrl : std_logic_vector(2 downto 0);
   signal Immctrl : std_logic_vector(3 downto 0);
   signal Rs : std_logic_vector(3 downto 0);
   signal Rt : std_logic_vector(3 downto 0);
   signal Rd : std_logic_vector(3 downto 0);
   signal ctrl1 : std_logic;
   signal ctrl2 : std_logic;
   signal AccMEM : std_logic;
   signal memWE : std_logic;
   signal regWE : std_logic;
   signal DataIN : std_logic_vector(15 downto 0);
   signal newT : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control PORT MAP (
          Inst => Inst,
          A => A,
          B => B,
          Imm => Imm,
          T => T,
          OP => OP,
          Wctrl => Wctrl,
          PCctrl => PCctrl,
          RFctrl => RFctrl,
          Immctrl => Immctrl,
          Rs => Rs,
          Rt => Rt,
          Rd => Rd,
          ctrl1 => ctrl1,
          ctrl2 => ctrl2,
          AccMEM => AccMEM,
          memWE => memWE,
          regWE => regWE,
          DataIN => DataIN,
          newT => newT
        );

  

END;
