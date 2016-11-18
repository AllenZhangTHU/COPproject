----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:24:26 11/18/2016 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity main is
    Port ( FLASH_A : out  STD_LOGIC_VECTOR (22 downto 0);
           FLASH_D : inout  STD_LOGIC_VECTOR (15 downto 0);
           FPGA_KEY : in  STD_LOGIC_VECTOR (3 downto 0);
           CLK0 : in  STD_LOGIC;
           CLK1 : in  STD_LOGIC;
           LCD_CS1 : out  STD_LOGIC;
           LCD_CS2 : out  STD_LOGIC;
           LCD_DB : inout  STD_LOGIC_VECTOR (7 downto 0);
           LCD_E : out  STD_LOGIC;
           LCD_RESET : out  STD_LOGIC;
           LCD_RS : out  STD_LOGIC;
           LCD_RW : out  STD_LOGIC;
           VGA_R : out  STD_LOGIC_VECTOR (2 downto 0);
           VGA_G : out  STD_LOGIC_VECTOR (2 downto 0);
           VGA_B : out  STD_LOGIC_VECTOR (2 downto 0);
           VGA_HHYNC : out  STD_LOGIC;
           VGA_VHYNC : out  STD_LOGIC;
           PS2KB_CLOCK : out  STD_LOGIC;
           PS2KB_DATA : in  STD_LOGIC;
           RAM1DATA : inout  STD_LOGIC_VECTOR (15 downto 0);
           SW_DIP : in  STD_LOGIC_VECTOR (15 downto 0);
           FLASH_BYTE# : out  STD_LOGIC;
           FLASH_CE : out  STD_LOGIC;
           FLASH_CE1 : out  STD_LOGIC;
           FLASH_CE2 : out  STD_LOGIC;
           FLASH_OE : out  STD_LOGIC;
           FLASH_RP# : out  STD_LOGIC;
           FLASH_STS : out  STD_LOGIC;
           FLASH_VPEN : out  STD_LOGIC;
           FLASH_WE : out  STD_LOGIC;
           U_RXD : out  STD_LOGIC;
           U_TXD : out  STD_LOGIC;
           RAM2DATA : inout  STD_LOGIC_VECTOR (15 downto 0);
           RAM1EN : out  STD_LOGIC;
           RAM1OE : out  STD_LOGIC;
           RAM1RW : out  STD_LOGIC;
           FPGA_LED : out  STD_LOGIC_VECTOR (15 downto 0);
           RAM2EN : out  STD_LOGIC;
           RAM2OE : out  STD_LOGIC;
           RAM2RW : out  STD_LOGIC;
           RAM1ADDR : out  STD_LOGIC_VECTOR (17 downto 0);
           RAM2ADDR : out  STD_LOGIC_VECTOR (17 downto 0);
           DYP0 : out  STD_LOGIC_VECTOR (6 downto 0);
           DYP1 : out  STD_LOGIC_VECTOR (6 downto 0);
           CLK_FROM_KEY : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           InterConn : inout  STD_LOGIC_VECTOR (9 downto 0));
end main;

architecture Behavioral of main is

begin


end Behavioral;

