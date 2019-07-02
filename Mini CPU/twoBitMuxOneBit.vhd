----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:27:36 05/01/2019 
-- Design Name: 
-- Module Name:    twoBitMuxOneBit - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity twoBitMuxOneBit is
Port ( 
			a, b : in  std_logic;
			selector : in std_logic;
         res : out  std_logic
			 );
end twoBitMuxOneBit;

architecture Behavioral of twoBitMuxOneBit is


begin
	res <= a when selector = '0' else
			 b when selector = '1';


end Behavioral;

