----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:29 05/01/2019 
-- Design Name: 
-- Module Name:    MainModule - Behavioral 
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
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MainModule is
PORT
(
	START: IN STD_LOGIC;
	CLK: IN STD_LOGIC;
	RegFileOut1: OUT STD_LOGIC_VECTOR(31 downto 0);
	RegFileOut2: OUT STD_LOGIC_VECTOR(31 downto 0);
	ALUOut: OUT STD_LOGIC_VECTOR(31 downto 0);
	PCOut: OUT STD_LOGIC_VECTOR(31 downto 0);
	DataMemOut: OUT STD_LOGIC_VECTOR(31 downto 0)
);
end MainModule;

architecture Behavioral of MainModule is
signal pcMuxRes: std_logic_vector(31 downto 0);
signal tmpPcOut: std_logic_vector(31 downto 0);
signal aluAddFourPcRes: std_logic_vector(31 downto 0);
signal aluAddPcRes: std_logic_vector(31 downto 0);
signal inputPcMuxRes: std_logic_vector(31 downto 0);
signal instruction: std_logic_vector(31 downto 0);
signal regFileOut_1: std_logic_vector(31 downto 0);
signal regFileOut_2: std_logic_vector(31 downto 0);
signal mainAluRes: std_logic_vector(31 downto 0);
signal dataMemRes: std_logic_vector(31 downto 0);
signal dataMemMuxRes: std_logic_vector(31 downto 0);
signal signExtendRes: std_logic_vector(31 downto 0);
signal regFileMuxRes: std_logic_vector(31 downto 0);
signal shiftLeftRes: std_logic_vector(31 downto 0);
signal jumpAddress: std_logic_vector(31 downto 0);
signal aluAddFourPcCF: std_logic;
signal aluAddFourPcOF: std_logic;
signal aluAddFourPcZF: std_logic;
signal aluAddPcCF: std_logic;
signal aluAddPcOF: std_logic;
signal aluAddPcZF: std_logic;
signal mainAluCF: std_logic;
signal mainAluZF: std_logic;
signal mainAluOF: std_logic;
signal writeRegMuxOut:std_logic_vector(4 downto 0);
signal mainAluOp:std_logic_vector(3 downto 0);
signal CURegDst :  STD_LOGIC;
signal CUALUSrc :  STD_LOGIC;
signal CUMemtoReg :  STD_LOGIC;
signal CURegWrite :  STD_LOGIC;
signal CUMemRead :  STD_LOGIC;
signal CUMemWrite :  STD_LOGIC;
signal CUBranch :  STD_LOGIC;
signal CUALUOp1 :  STD_LOGIC;
signal CUALUOp0 :  STD_LOGIC;
signal CUjump :  STD_LOGIC;
signal CUBne :  STD_LOGIC;
signal andGateBeqRes :  STD_LOGIC;
signal andGateBneRes :  STD_LOGIC;
signal beqBneMuxRes :  STD_LOGIC;
signal orBeqBne :  STD_LOGIC;


begin
	aluAddFourPc:ALU port map(tmpPcOut , "00000000000000000000000000000100", "0010", '0', aluAddFourPcRes , aluAddFourPcCF, aluAddFourPcZF, aluAddFourPcOF); --done
	 
	shiftLeft: shiftLeftModule PORT MAP(signExtendRes, shiftLeftRes); --done
	aluAddPc: ALU port map(aluAddFourPcRes, shiftLeftRes, "0010", '0', aluAddPcRes , aluAddPcCF, aluAddPcZF, aluAddPcOF); --done
	inputPcMux: twoBitMux PORT MAP(aluAddFourPcRes,aluAddPcRes ,orBeqBne,inputPcMuxRes);--done
	
	jumpAddress <= aluAddFourPcRes (31 downto 28) &(instruction(25 downto 0)&"00");--done
	
	pcMux: twoBitMux PORT MAP(inputPcMuxRes, jumpAddress, CUjump, pcMuxRes);--done
	programCounter: reg GENERIC MAP(32) port map(pcMuxRes, CLK, start, '0', not(start), tmpPcOut); -- done
	
	controlUnit: CU PORT MAP(instruction(31 downto 26), CURegDst, CUALUSrc, CUMemtoReg, CURegWrite, CUMemRead, CUMemWrite, CUBranch, CUALUOp1, CUALUOp0,CUjump, CUBne); -- done
	
	instructonMemory: INSTRMEMORY port map(not(start) ,instruction, tmpPcOut, CLK); --done
	--instructonMemory: INSTRMEMORY GENERIC MAP(64, 32, 32) port map(start ,instruction, tmpPcOut, CLK); --done
	writeRegMux: fiveBitMux PORT MAP (instruction(20 downto 16),instruction(15 downto 11), CURegDst, writeRegMuxOut); --done
	regFile : RegisterFile PORT MAP(instruction(25 downto 21),instruction(20 downto 16),writeRegMuxOut, CURegWrite, CLK, dataMemMuxRes, regFileOut_1, regFileOut_2); -- done
	aluCU: ALUControl port map(CUALUOp0,CUALUOp1,instruction(5 downto 0),mainAluOp); --done
	signExtention: signExtend port map(instruction(15 downto 0) , signExtendRes); --done
	regFileMux: twoBitMux port map(regFileOut_2,signExtendRes , CUALUSrc,regFileMuxRes); --done
	mainALU: ALU port map(regFileOut_1, regFileMuxRes, mainAluOp, '0',mainAluRes, mainAluCF, mainAluZF, mainAluOF); --done
	dataMem: DATAMEMORY port map(not(start), regFileOut_2 , dataMemRes , CUMemRead,CUMemWrite, mainAluRes, CLK); -- done bs lsa hnt2kd mn not start
	dataMemMux: twoBitMux port map(mainAluRes , dataMemRes, CUMemtoReg, dataMemMuxRes); --done
	
	--andGateRes <= beqBneMuxRes and CUBranch;
	andGateBeqRes <= CUBranch and mainAluZF;
	andGateBneRes <= CUBne and (not(mainAluZF));
	orBeqBne <= andGateBeqRes or andGateBneRes;
	--beqBneMux: twoBitMuxOneBit port map(andGateBneRes, andGateBeqRes, mainAluZF, beqBneMuxRes);
	
	RegFileOut1 <= regFileOut_1;
	RegFileOut2 <= regFileOut_2;
	ALUOut <= mainAluRes;
	PCOut <= tmpPcOut;
	DataMemOut <= dataMemRes;
	
end Behavioral;

