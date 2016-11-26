library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity RAM_UART is
    Port (
			CLK : in  STD_LOGIC;
			RST : in STD_LOGIC;
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
	
	signal Ram_Uart_ctrl : STD_LOGIC;
begin
	process(CLK, RST, ACCMEM, MEM_WE, addr, data, data_ready, tbre, tsre)
		variable state : integer range 0 to 1 := 0;
		variable state_uart : integer range 0 to 3 := 0;
	begin
	
		if (addr = "1011111100000000") or (addr = "1011111100000001") then
			Ram_Uart_ctrl <= '0';
		else
			Ram_Uart_ctrl <= '1';
		end if;
		
		if (CLK'EVENT) and (CLK = '0') then
			if (MEM_WE = '1') and (ACCMEM = '0') and (Ram_Uart_ctrl = '1') then --RAM write
				case state is
					when 0 => 	wrn <= '1';
									rdn <= '1';
									Ram1EN <= '0';
									Ram1OE <= '1';
									Ram1WE <= '1';
									RAM1Addr(17 downto 16) <= "00";
									RAM1Addr(15 downto 0) <= addr;
									RAM1Data <= data;
									state := 1;
					when 1 => 	Ram1WE <= '0';
									state := 0;
					when others => null;
				end case;
			end if;
			
			if (MEM_WE = '0') and (ACCMEM = '1') and (Ram_Uart_ctrl = '1') then --RAM read
				case state is
					when 0 => 	wrn <= '1';
									rdn <= '1';
									Ram1EN <= '0';
									Ram1OE <= '0';
									Ram1WE <= '1';
									RAM1Data <= (others => 'Z');
									RAM1Addr(17 downto 16) <= "00";
									RAM1Addr(15 downto 0) <= addr;
									state := 1;
					when 1 => 	data_out <= Ram1Data;
									state := 0;
					when others => null;
				end case;
			end if;
			
			if (MEM_WE = '0') and (ACCMEM = '1') and (Ram_Uart_ctrl = '0') then --UART read
				case state is
					when 0 => 	rdn <= '1';
									RAM1EN <= '1';
									RAM1OE <= '1';
									RAM1WE <= '1';
									RAM1Data <= (others => 'Z');
									state := 1;
					when 1 => 	if (data_ready = '1') then
										rdn <= '0';
									end if;
									state := 0;
					when others => null;
				end case;
			end if;
			
			if (MEM_WE = '1') and (ACCMEM = '0') and (Ram_Uart_ctrl = '0') then --UART write
				if (state_uart = 0) then 
					wrn <= '1';
					Ram1EN <= '1';
					Ram1OE <= '1';
					Ram1WE <= '1';
					state_uart := 1;
				end if;
				
				if (state_uart = 1) then 
					RAM1Data <= data;
					state_uart := 2;
				end if;
				
			end if;	
			
			if (state_uart = 2) then 
				wrn <= '0';
				state_uart := 3;
			end if;
			
			if (state_uart = 3) then 
				wrn <= '1';
				state_uart := 0;
			end if;
				
--				case state_uart is
--						when 0 => 	wrn <= '1';
--										Ram1EN <= '1';
--										Ram1OE <= '1';
--										Ram1WE <= '1';
--										RAM1Data <= data;
--										state_uart := 1;
--						when 1 => 	wrn <= '0';
--										state_uart := 2;
--						when 2 =>	wrn <= '1';
--										if (tsre = '1') and (tbre = '1') then
--											
--										end if;
--										state_uart := 0;
--						when others => null;
--				end case;

			
			
			if (addr = "1011111100000001") then
				if (tsre = '0') or (tbre = '0') then
					data_out <= "1111111111111111";
				else
					data_out <= "0000000000000000";
				end if;
			else
				data_out <= Ram1Data;
			end if;
			
		end if;
		
--		if (MEM_WE = '1') and (ACCMEM = '0') and (state = 1) then
--			wrn <= not CLK;
--		else
--			wrn <= '1';
--		end if;
		
		if (RST = '0') then
			Ram1OE <= '0';
			Ram1WE <= '0';
			Ram1EN <= '0';
			state := 0;
			state_uart := 0;
			wrn <= '1';
			rdn <= '1';
		end if;
		
	end process;

end Behavioral;