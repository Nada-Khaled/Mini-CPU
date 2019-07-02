----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:41:49 05/05/2019 
-- Design Name: 
-- Module Name:    fiveBitMux - Behavioral 
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

entity fiveBitMux is
  Port ( 
			a, b : in  std_logic_vector(4 downto 0);
			selector : in std_logic;
         res : out  std_logic_vector(4 downto 0)
			 );
end fiveBitMux;

architecture Behavioral of fiveBitMux is

begin

	res <= a when selector = '0' else
			 b when selector = '1' else 
			 (others =>'Z');

end Behavioral;

