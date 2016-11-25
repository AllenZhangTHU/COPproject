library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity RAM_UART is
    Port (
		CLK : in  STD_LOGIC;
  ACCMEM : in  STD_LOGIC;
  MEM_WE : in  STD_LOGIC;
  addr : in  STD_LOGIC_VECTOR (15 downto 0);
  data : in  STD_LOGIC_VECTOR (15 downto 0);
  data_out : out STD_LOGIC_VECTOR (15 downto 0);
  Ram1Addr : out  STD_LOGIC_VECTOR (17 downto 0);
  Ram1Data : inout  STD_LOGIC_VECTOR (15 downto 0);
  Ram1OE : out  STD_LOGIC;
  Ram1WE : out  STD_LOGIC;
  Ram1EN : out  STD_LOGIC;
  wrn : out STD_LOGIC;
  rdn : out STD_LOGIC;

  data_ready : in  STD_LOGIC;
  tbre : in  STD_LOGIC;
  tsre : in  STD_LOGIC);
end RAM_UART;

architecture Behavioral of RAM_UART is
	signal state_uart_in : integer range 0 to 3 := 0;
	signal state_uart_out : integer range 0 to 5 := 0;
	signal state_ram_in : integer range 0 to 3 := 0;
	signal state_ram_out : integer range 0 to 3 := 0;
	signal Ram_Uart_ctrl : STD_LOGIC;
begin
	process(CLK)
	begin
		if (CLK'EVENT) and (CLK = '1') then
			if (addr = "1011111100000000") then
				Ram_Uart_ctrl <= '0';
			else
				Ram_Uart_ctrl <= '1';
			end if;
			if (MEM_WE = '1') and (ACCMEM = '0') then
				if (Ram_Uart_ctrl = '0') then --UART Write
					case state_uart_in is
						when 0 => 
							state_uart_in <= 1;
							rdn <= '1';
							RAM1OE <= '1';
							RAM1WE <= '1';
							RAM1EN <= '1';
							RAM1Data <= (others => 'Z');
						when 1 => 
							rdn <= '1';
							if (data_ready = '1') then
								state_uart_in <= 2;
							else
								state_uart_in <= 0;
							end if;
						when 2 => 
							state_uart_in <= 3;
							rdn <= '0';
						when 3 => 
							state_uart_in <= 0;
							data_out <= RAM1Data;
						when others =>
							null;
					end case;
				else -- RAM Write
					wrn <= '1';
					rdn <= '1';
					case state_ram_in is
						when 0 =>
							state_ram_in <= 1;
							Ram1EN <= '1';
						when 1 =>
							state_ram_in <= 2;
							Ram1EN <= '0';
							Ram1OE <= '1';
							Ram1WE <= '1';
						when 2 =>
							state_ram_in <= 3;
							RAM1Addr(17 downto 16) <= "00";
							RAM1Addr(15 downto 0) <= addr;
							RAM1Data <= data;
							Ram1WE <= '1';
						when 3 =>
							Ram1WE <= '0';
							state_ram_in <= 0;
						when others =>
							null;
					end case;
				end if;
			end if;

			if (MEM_WE = '0') and (ACCMEM = '1') then
				if (Ram_Uart_ctrl = '0') then --UART Read
					case state_uart_out is
						when 0 => 
							state_uart_out <= 1;
							wrn <= '1';
							Ram1EN <= '1';
							Ram1OE <= '1';
							Ram1WE <= '1';
						when 1 => 
							state_uart_out <= 2;
							RAM1Data <= data;
						when 2 => 
							state_uart_out <= 3;
							wrn <= '0';
						when 3 => 
							state_uart_out <= 4;
							wrn <= '1';
						when 4 =>
							if (tbre = '1') then
								state_uart_out <= 5;
							end if;
						when 5 => 
							if (tsre = '1') then
								state_uart_out <= 0;
							end if;
						when others =>
							null;
					end case;
				else -- RAM Read
					wrn <= '1';
					rdn <= '1';
					case state_ram_out is
						when 0 =>
							state_ram_out <= 1;
							Ram1EN <= '0';
							Ram1OE <= '0';
							Ram1WE <= '1';
						when 1 =>
							state_ram_out <= 2;
							RAM1Data <= "ZZZZZZZZZZZZZZZZ";
						when 2 =>
							state_ram_out <= 3;
							RAM1Addr(17 downto 16) <= "00";
							RAM1Addr(15 downto 0) <= addr;
						when 3 =>
							data_out <= Ram1Data;
							state_ram_out <= 0;
						when others =>
							null;
					end case;
				end if;
			end if;
		end if;
	end process;

end Behavioral;