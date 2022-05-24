
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


entity Simpleblock is

   port 
   (
      reg1      : in std_logic_vector(7 downto 0);
--      reg2      : in std_logic_vector(7 downto 0);
--      reg3      : out std_logic_vector(7 downto 0);
      sgp      : out std_logic_vector(0 downto 0);
      
   );

end entity;

architecture rtl of Simpleblock is

--   signal tmp : std_logic := 0 ;
--   constant const    : std_logic_vector(3 downto 0) := "1000";

begin

   sgp<= std_logic_vector(unsigned(reg1));
   
   
end rtl;

