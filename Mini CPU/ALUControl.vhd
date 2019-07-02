----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:05:17 05/01/2019 
-- Design Name: 
-- Module Name:    ALUControl - Behavioral 
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

entity ALUControl is
    Port ( ALUOp0 : in  STD_LOGIC;
			  ALUOp1 : in  STD_LOGIC;
           Fun : in  STD_LOGIC_VECTOR (5 downto 0);
           Operation : out  STD_LOGIC_VECTOR (3 downto 0));
end ALUControl;

architecture Behavioral of ALUControl is
signal orF0F3: std_logic;
signal andF0F1: std_logic;
signal andFun1Aluop1: std_logic;
signal orF0F3Res_Aluop1_and: std_logic;
signal operation1: std_logic;
signal operation2: std_logic; 
signal operation3: std_logic;
signal operation0: std_logic;
begin
orF0F3 <= Fun(0) or Fun(3);
andF0F1 <= Fun(0) and Fun(1);
andFun1Aluop1 <= Fun(1) and ALUOp1;
orF0F3Res_Aluop1_and <= orF0F3 and ALUOp1;
operation1 <= (not(Fun(2))) or (not(ALUOp1));
operation2 <= andFun1Aluop1 or ALUOp0;
operation3 <= andF0F1 and ALUOp1;
operation0 <= orF0F3Res_Aluop1_and and (not(operation3));

Operation(0) <= operation0;
Operation(1) <= operation1;
Operation(2) <= operation2;
Operation(3) <= operation3;

end Behavioral;

