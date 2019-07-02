----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:07:39 04/16/2019 
-- Design Name: 
-- Module Name:    reg - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myReg is
	PORT (
		I: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		CLK, LoD, INC, CLR: IN STD_LOGIC;
		O: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
);

end myReg;
ARCHITECTURE Behavioral OF myReg IS
SIGNAL temp: STD_LOGIC_VECTOR (31 DOWNTO 0);
BEGIN

	PROCESS(clk)
	BEGIN
	IF(CLK'event AND CLK='0')THEN
	IF(LoD ='1') THEN
		temp <= I;
	ELSIF (INC='1')THEN
		temp <= temp +1;
	ELSIF(CLR='1') THEN
		temp <=(others =>'0');
	END IF;
	END IF;
	END PROCESS;
	O <= temp;
	
end Behavioral;

