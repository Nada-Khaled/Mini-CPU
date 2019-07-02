----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:52:04 04/10/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use work.MyPackage.all;
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
PORT(
         data1   : IN  std_logic_vector(31 downto 0);
         data2   : IN  std_logic_vector(31 downto 0);
         aluop   : IN  std_logic_vector(3 downto 0);
         cin     : IN  std_logic;
         dataout : OUT  std_logic_vector(31 downto 0);
         cflag   : OUT  std_logic;
         zflag   : OUT  std_logic;
         oflag   : OUT  std_logic
        );
end ALU;

architecture Behavioral of ALU is

--signal carryOuts: std_logic_vector(31 downto 0);
signal dataOutTemp: std_logic_vector(31 downto 0);

signal tmpOR: std_logic;
signal tmpCF: std_logic_vector(31 downto 0);
signal tmpCIN: STD_LOGIC;
signal tmpOF: std_logic;
signal data2Final: std_logic_vector(31 downto 0);
signal data1Final: std_logic_vector(31 downto 0);
signal tmpZF: integer;
signal lastAluSet : std_logic_vector(31 downto 0);

begin
	
	mux21 : twoBitMux PORT MAP(data2, not(data2), aluop(2), data2Final);
	mux211 : twoBitMux PORT MAP(data1, not(data1), aluop(3), data1Final);

	alu0 : OneBitALU PORT MAP( data1Final(0) , data2Final(0) , lastAluSet(31), aluop , aluop(2) ,lastAluSet(0), dataOutTemp(0) , tmpCF(0));
	alu1 : OneBitALU PORT MAP( data1Final(1) , data2Final(1) , '0', aluop , tmpCF(0) ,lastAluSet(1), dataOutTemp(1) , tmpCF(1) );
	alu2 : OneBitALU PORT MAP( data1Final(2) , data2Final(2) , '0', aluop , tmpCF(1) , lastAluSet(2),dataOutTemp(2) , tmpCF(2));
	alu3 : OneBitALU PORT MAP( data1Final(3) , data2Final(3) , '0', aluop , tmpCF(2) ,lastAluSet(3), dataOutTemp(3) , tmpCF(3));
	alu4 : OneBitALU PORT MAP( data1Final(4) , data2Final(4) , '0', aluop , tmpCF(3) ,lastAluSet(4), dataOutTemp(4) , tmpCF(4));
	alu5 : OneBitALU PORT MAP( data1Final(5) , data2Final(5) , '0', aluop , tmpCF(4) ,lastAluSet(5), dataOutTemp(5) , tmpCF(5));
	alu6 : OneBitALU PORT MAP( data1Final(6) , data2Final(6) , '0', aluop , tmpCF(5) ,lastAluSet(6), dataOutTemp(6) , tmpCF(6));
	alu7 : OneBitALU PORT MAP( data1Final(7) , data2Final(7) , '0', aluop , tmpCF(6) ,lastAluSet(7), dataOutTemp(7) , tmpCF(7));
	alu8 : OneBitALU PORT MAP( data1Final(8) , data2Final(8) , '0', aluop , tmpCF(7) ,lastAluSet(8), dataOutTemp(8) , tmpCF(8));
	alu9 : OneBitALU PORT MAP( data1Final(9) , data2Final(9) , '0', aluop , tmpCF(8) ,lastAluSet(9), dataOutTemp(9) , tmpCF(9));
	alu10 : OneBitALU PORT MAP( data1Final(10) , data2Final(10) , '0', aluop , tmpCF(9)  ,lastAluSet(10), dataOutTemp(10) , tmpCF(10));
	alu11 : OneBitALU PORT MAP( data1Final(11) , data2Final(11) , '0', aluop , tmpCF(10) ,lastAluSet(11), dataOutTemp(11) , tmpCF(11));
	alu12 : OneBitALU PORT MAP( data1Final(12) , data2Final(12) , '0', aluop , tmpCF(11) ,lastAluSet(12), dataOutTemp(12) , tmpCF(12));
	alu13 : OneBitALU PORT MAP( data1Final(13) , data2Final(13) , '0', aluop , tmpCF(12) ,lastAluSet(13), dataOutTemp(13) , tmpCF(13));
	alu14 : OneBitALU PORT MAP( data1Final(14) , data2Final(14) , '0', aluop , tmpCF(13) ,lastAluSet(14), dataOutTemp(14) , tmpCF(14));
	alu15 : OneBitALU PORT MAP( data1Final(15) , data2Final(15) , '0', aluop , tmpCF(14) ,lastAluSet(15), dataOutTemp(15) , tmpCF(15));
	alu16 : OneBitALU PORT MAP( data1Final(16) , data2Final(16) , '0', aluop , tmpCF(15) ,lastAluSet(16), dataOutTemp(16) , tmpCF(16));
	alu17 : OneBitALU PORT MAP( data1Final(17) , data2Final(17) , '0', aluop , tmpCF(16) ,lastAluSet(17), dataOutTemp(17) , tmpCF(17));
	alu18 : OneBitALU PORT MAP( data1Final(18) , data2Final(18) , '0', aluop , tmpCF(17) ,lastAluSet(18), dataOutTemp(18) , tmpCF(18));
	alu19 : OneBitALU PORT MAP( data1Final(19) , data2Final(19) , '0', aluop , tmpCF(18) ,lastAluSet(19), dataOutTemp(19) , tmpCF(19));
	alu20 : OneBitALU PORT MAP( data1Final(20) , data2Final(20) , '0', aluop , tmpCF(19) ,lastAluSet(20), dataOutTemp(20) , tmpCF(20));
	alu21 : OneBitALU PORT MAP( data1Final(21) , data2Final(21) , '0', aluop , tmpCF(20) ,lastAluSet(21), dataOutTemp(21) , tmpCF(21));
	alu22 : OneBitALU PORT MAP( data1Final(22) , data2Final(22) , '0', aluop , tmpCF(21) ,lastAluSet(22), dataOutTemp(22) , tmpCF(22));
	alu23 : OneBitALU PORT MAP( data1Final(23) , data2Final(23) , '0', aluop , tmpCF(22) ,lastAluSet(23), dataOutTemp(23) , tmpCF(23));
	alu24 : OneBitALU PORT MAP( data1Final(24) , data2Final(24) , '0', aluop , tmpCF(23) ,lastAluSet(24), dataOutTemp(24) , tmpCF(24));
	alu25 : OneBitALU PORT MAP( data1Final(25) , data2Final(25) , '0', aluop , tmpCF(24) ,lastAluSet(25), dataOutTemp(25) , tmpCF(25));
	alu26 : OneBitALU PORT MAP( data1Final(26) , data2Final(26) , '0', aluop , tmpCF(25) ,lastAluSet(26), dataOutTemp(26) , tmpCF(26));
	alu27 : OneBitALU PORT MAP( data1Final(27) , data2Final(27) , '0', aluop , tmpCF(26) ,lastAluSet(27), dataOutTemp(27) , tmpCF(27));
	alu28 : OneBitALU PORT MAP( data1Final(28) , data2Final(28) , '0', aluop , tmpCF(27) ,lastAluSet(28), dataOutTemp(28) , tmpCF(28));
	alu29 : OneBitALU PORT MAP( data1Final(29) , data2Final(29) , '0', aluop , tmpCF(28) ,lastAluSet(29), dataOutTemp(29) , tmpCF(29));
	alu30 : OneBitALU PORT MAP( data1Final(30) , data2Final(30) , '0', aluop , tmpCF(29) ,lastAluSet(30), dataOutTemp(30) , tmpCF(30));
	alu31 : OneBitALU PORT MAP( data1Final(31) , data2Final(31) , '0', aluop , tmpCF(30) ,lastAluSet(31), dataOutTemp(31) , tmpCF(31));
	
	dataout <= dataOutTemp;
	oflag <= tmpCF(30) xor tmpCF(31);
	cflag <= tmpCF(31);
	
	tmpZF <= to_integer(signed(dataOutTemp));
	zflag <= '1' when tmpZF = 0 else
			'0';
																		 --cin
   --alu : OneBitALU PORT MAP (data1(0), data2(0), aluop , aluop(2) , dataOutTemp(0),carryOuts(0));	
	--alus : for i in 1 to 31 generate
	--	    alu : OneBitALU PORT MAP (data1(i), data2(i), aluop , carryOuts(i-1) , dataOutTemp(i),carryOuts(i));		
	--end generate alus;
	
--	cflag <= carryOuts(31);
--	oflag <= carryOuts(30) XOR carryOuts(31);
	
--	process
--	begin
--		zflag <= '1';
--		for i in 0 to 31 loop
--			dataout(i) <= dataOutTemp(i);
--			if (dataOutTemp(i) = '1')then
--				zflag <= '0';
--			end if;
--		end loop;
--	end process;
	
end Behavioral;