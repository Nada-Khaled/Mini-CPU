----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:33:01 05/01/2019 
-- Design Name: 
-- Module Name:    lastOneBitALU - Behavioral 
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
use work.MyPackage.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lastOneBitALU is
port
(
			data1 : IN  std_logic;
         data2 : IN  std_logic;
			less : IN std_logic;
         aluop : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
			set : OUT std_logic;
         dataout : OUT  std_logic;
         cflag : OUT  std_logic
);
end lastOneBitALU;

architecture Behavioral of lastOneBitALU is
signal adderRes: std_logic;

signal mergedSelector : std_logic_vector(1 downto 0);
signal notOr : std_logic;
signal finalOrRes : std_logic;

begin

			
	--choose b or not b with mux  -- result in data2Final
	--mux21 : twoBitMux PORT MAP(data2 , not (data2), opcode,data2Final );
	
	adder : FullAdder PORT MAP (data1 , data2 , cin , adderRes , cflag);
	mergedSelector <= aluop(1 downto 0);

--implementing Nor	
	notOr <= not((data1 or data2));
	mux21 : twoBitMuxOneBit PORT MAP((data1 or data2), notOr, aluop(3), finalOrRes);
	
																				--add or sub
	mux42 : fourBitMux PORT MAP((data1 and data2),finalOrRes , adderRes, less, mergedSelector, dataout);
	
	
	set <= adderRes;

end Behavioral;

