library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Simpleblock_TB is

 

end entity;

 

architecture TB of Simpleblock_TB is

			  constant PERIOD : time := 20 ns;
           signal clk : std_logic := '0';
           signal rst_n : std_logic :='0';
           signal reg3 : std_logic_vector(7 downto 0);
           signal GPIO_0 : std_logic;

           component Simpleblock is
                    port (

                     clk : in std_logic;
                     rst_n : in std_logic;
                     reg3 : in std_logic_vector(7 downto 0);
                     GPIO_0 : out std_logic;

                     );

           end component;
			  



begin

        Simpleblock_I : Simpleblock
                                port map(
                                        clk => clk,
                                        rst_n => rst_n,
                                        reg3 => reg3,
                                        GPIO_0 => GPIO_0

                                          );

 

           rst_n_P: process --on fait juste passer le reset de 0 à 1

           begin

                     rst_n <= '0';

                     wait for PERIOD/2;

                     rst_n <='1';

                     wait for PEIROD/2;

           end process;

          

           clk_P : process -- on fait passer aussi la clk de 0 à 1

           begin

                     clk <= '0';

                     wait for PERIOD/2;

                     clk <= '1';

                     wait for PERIOD/2;

           end process;

          

           stimulus_P : process

           begin

           wait until rst_n = '1'; --
				reg3 <= "00000000";
          -- reg3 <= std_logic_vector(to_unsigned(0,8)); -- on ecrit dans le registre ; le 8 donne la taile du vecteur ici 8 bits, 
			  --le 0 est la valeur que l'on ecrit dans le vecteur : 00000000

           wait for PERIOD;
			  
			  reg3 <= "00000111";

           --reg3 <= std_logic_vector(to_unsigned(1,8)); -- 00000001

           wait for PERIOD;
			  reg3 <= "11111111";
          
           --reg3 <= std_logic_vector(to_unsigned(255,8)); --11111111 

           wait for PERIOD;

 

end process;

                    

end TB;