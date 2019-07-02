----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:54:15 05/01/2019 
-- Design Name: 
-- Module Name:    CU - CUArchitecture 
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

entity CU is
    Port ( OpCode : in  STD_LOGIC_VECTOR(5 downto 0);
           RegDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUOp1 : out  STD_LOGIC;
           ALUOp0 : out  STD_LOGIC;
			  jump: out std_logic;
			  branchNE: out std_logic);
end CU;

architecture CUArchitecture of CU is
signal R_format, lw, sw, beq, bne: std_logic;
begin

R_format <= (not Opcode(0)) and (not Opcode(1)) and (not Opcode(2)) and (not Opcode(3)) and (not Opcode(4)) and (not Opcode(5));
lw <= (Opcode(0)) and (Opcode(1)) and (not Opcode(2)) and (not Opcode(3)) and (not Opcode(4)) and (Opcode(5));
sw <= (Opcode(0)) and ( Opcode(1)) and (not Opcode(2)) and (Opcode(3)) and (not Opcode(4)) and (Opcode(5));
beq <= (not Opcode(0)) and (not Opcode(1)) and (Opcode(2)) and (not Opcode(3)) and (not Opcode(4)) and (not Opcode(5));
bne <= (Opcode(0)) and (not Opcode(1)) and (Opcode(2)) and (not Opcode(3)) and (not Opcode(4)) and (not Opcode(5));

--------------------------------------------------------------------------------

RegDst <= R_format;
ALUSrc <= (lw or sw);
MemtoReg <= lw;
RegWrite <= (lw or R_format);
MemRead <= lw;
MemWrite <= sw;
Branch <= beq;
ALUOp1 <= R_format;
ALUOp0 <= beq;
jump <= (not Opcode(0)) and (Opcode(1)) and (not Opcode(2)) and (not Opcode(3)) and (not Opcode(4)) and (not Opcode(5));
branchNE <= bne;
end CUArchitecture;

