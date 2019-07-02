----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:21:24 04/10/2019 
-- Design Name: 
-- Module Name:    fourBitMux - Behavioral 
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

entity fourBitMux is
    Port (  andOperation : IN STD_LOGIC;
				orOperation : IN STD_LOGIC;
				addOperation : in  STD_LOGIC;
				less : IN STD_LOGIC;
           selector : in  STD_LOGIC_VECTOR(1 downto 0);
           res : out  STD_LOGIC);
end fourBitMux;

architecture Behavioral of fourBitMux is

begin
res <= andOperation when selector = "00" else
		 orOperation when selector = "01" else
		 addOperation when selector = "10" else
		 less when selector = "11";

end Behavioral;

