----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:57:13 04/14/2019 
-- Design Name: 
-- Module Name:    MUX32 - Behavioral 
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

entity MUX32 is
     Port ( selector  : in  STD_LOGIC_VECTOR (4 downto 0);
					reg0: in std_logic_vector(31 downto 0);
					reg1: in std_logic_vector(31 downto 0);
					reg2: in std_logic_vector(31 downto 0);
					reg3: in std_logic_vector(31 downto 0);
					reg4: in std_logic_vector(31 downto 0);
					reg5: in std_logic_vector(31 downto 0);
					reg6: in std_logic_vector(31 downto 0);
					reg7: in std_logic_vector(31 downto 0);
					reg8: in std_logic_vector(31 downto 0);
					reg9: in std_logic_vector(31 downto 0);
					reg10: in std_logic_vector(31 downto 0);
					reg11: in std_logic_vector(31 downto 0);
					reg12: in std_logic_vector(31 downto 0);
					reg13: in std_logic_vector(31 downto 0);
					reg14: in std_logic_vector(31 downto 0);
					reg15: in std_logic_vector(31 downto 0);
					reg16: in std_logic_vector(31 downto 0);
					reg17: in std_logic_vector(31 downto 0);
					reg18: in std_logic_vector(31 downto 0);
					reg19: in std_logic_vector(31 downto 0);
					reg20: in std_logic_vector(31 downto 0);
					reg21: in std_logic_vector(31 downto 0);
					reg22: in std_logic_vector(31 downto 0);
					reg23: in std_logic_vector(31 downto 0);
					reg24: in std_logic_vector(31 downto 0);
					reg25: in std_logic_vector(31 downto 0);
					reg26: in std_logic_vector(31 downto 0);
					reg27: in std_logic_vector(31 downto 0);
					reg28: in std_logic_vector(31 downto 0);
					reg29: in std_logic_vector(31 downto 0);
					reg30: in std_logic_vector(31 downto 0);
					reg31: in std_logic_vector(31 downto 0);
           outputdata : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX32;

architecture Behavioral of MUX32 is

begin

outputdata <= reg0 when selector = "00000" else
				  reg1 when selector = "00001" else
				  reg2 when selector = "00010" else
				  reg3 when selector = "00011" else
				  reg4 when selector = "00100" else
				  reg5 when selector = "00101" else
				  reg6 when selector = "00110" else
				  reg7 when selector = "00111" else
				  reg8 when selector = "01000" else
				  reg9 when selector = "01001" else
				  reg10 when selector = "01010" else
				  reg11 when selector = "01011" else
				  reg12 when selector = "01100" else
				  reg13 when selector = "01101" else
				  reg14 when selector = "01110" else
				  reg15 when selector = "01111" else
				  reg16 when selector = "10000" else
				  reg17 when selector = "10001" else
				  reg18 when selector = "10010" else
				  reg19 when selector = "10011" else
				  reg20 when selector = "10100" else
				  reg21 when selector = "10101" else
				  reg22 when selector = "10110" else
				  reg23 when selector = "10111" else
				  reg24 when selector = "11000" else
				  reg25 when selector = "11001" else
				  reg26 when selector = "11010" else
				  reg27 when selector = "11011" else
				  reg28 when selector = "11100" else
				  reg29 when selector = "11101" else
				  reg30 when selector = "11110" else
				  reg31 when selector = "11111"; 
end Behavioral;

