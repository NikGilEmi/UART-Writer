
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;



entity Simpleblock is
		port (
			clk		: in std_logic;
			rst_n	: in std_logic;
			reg3	   : in std_logic_vector(7 downto 0);
			GPIO_0	: out std_logic
		);
end entity;
  
architecture RTL of Simpleblock is
	constant MAX : natural := 10_000;
	constant INDEX_MAX : natural := 8;
	type state_type is ( s0,s1,s2,s3 );
	signal state : state_type;   
	signal data : natural := 0;

begin 
			
	process (clk,rst_n,reg3)
		variable count : natural := 0;
		variable index : natural := 0;
	begin
		if rst_n = '0' then
			count := 0;
			index := 0;
			state <= s0;
			GPIO_0 <= '1';
		elsif rising_edge(clk) then
			case state is
				when s0 =>
					count := 0;
					index := 0;
						GPIO_0 <= '0';
						data <= to_integer(unsigned(reg3));
						state <= s1;
				when s1 =>
					count := count + 1; 
					if count >= MAX then
						count := 0;
						GPIO_0 <= std_logic_vector(to_unsigned(data,8))(index);
						index := index + 1;
						if index >= INDEX_MAX then 
							index := 0;
							state <= s2;
						end if;
					end if;
				when s2 =>
					index := 0;
					count := count + 1; 
					if count >= MAX then
						count := 0;
						GPIO_0 <= '0';
						state <= s3;
					end if;
				when s3 =>
					index := 0;
					count := count + 1; 
					if count >= MAX then
						count := 0;
						GPIO_0 <= '1';
						state <= s0;
					end if;
				when others =>
					count := 0;
					index := 0;
					state <= s0;
					GPIO_0 <= '1';
			end case;					
		end if;
	end process;
		
end RTL;

--entity Simpleblock is
--
--	port 
--	(
--		reg3		: in std_logic_vector(7 downto 0); -- on défini les ports qu'on va utiliser, ici reg3 qui est un vecteur de 8 bit défini en sortie
--		GPIO_0	: out std_logic
--	);
--
--end entity;
--
--architecture rtl of Simpleblock is
--
----	signal tmp : std_logic := 0 ;
----	constant const    : std_logic_vector(3 downto 0) := "1000";
--   constant INDEX_MAX : natural := 8;
--	--constant MAX : natural := 10_000;
--	type state_type is (s0);   
--	signal state : state_type;  
--	signal data : natural := 0;
--
--begin
--
--	
--	process (reg3) -- va s'activer lorsqu'il y aura un changement d'état de reg3
--		--variable count : natural := 0;
--			  variable index : natural := 0;
--	begin
--			-- index := 0; -- variable qui permet de parcourir le registre
--			GPIO_0<= '1'; -- bit d'initialisation
--			state <= s0; 
--				case state is
--
--					when S0 =>
--					--	count := count + 1; 
--					--	if count >= MAX then
--						data <= to_integer(unsigned(reg3)); -- problème ici
--						--	count := 0;
--						GPIO_0 <= std_logic_vector(to_unsigned(data,8))(index);
--						index := index + 1;
--						if index >= INDEX_MAX then 
--							index := 0;
--						end if;
--						
--					--end if;
--				end case;	
--		GPIO_0<='1';  -- bit de fin
--		end process;
--		
--	
--	
--end rtl;
