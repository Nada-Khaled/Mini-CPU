----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:53:17 04/10/2019 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
signal outputDecoder: std_logic_vector(31 downto 0);

signal reg0: std_logic_vector(31 downto 0);
signal reg1: std_logic_vector(31 downto 0);
signal reg2: std_logic_vector(31 downto 0);
signal reg3: std_logic_vector(31 downto 0);
signal reg4: std_logic_vector(31 downto 0);
signal reg5: std_logic_vector(31 downto 0);
signal reg6: std_logic_vector(31 downto 0);
signal reg7: std_logic_vector(31 downto 0);
signal reg8: std_logic_vector(31 downto 0);
signal reg9: std_logic_vector(31 downto 0);
signal reg10: std_logic_vector(31 downto 0);
signal reg11: std_logic_vector(31 downto 0);
signal reg12: std_logic_vector(31 downto 0);
signal reg13: std_logic_vector(31 downto 0);
signal reg14: std_logic_vector(31 downto 0);
signal reg15: std_logic_vector(31 downto 0);
signal reg16: std_logic_vector(31 downto 0);
signal reg17: std_logic_vector(31 downto 0);
signal reg18: std_logic_vector(31 downto 0);
signal reg19: std_logic_vector(31 downto 0);
signal reg20: std_logic_vector(31 downto 0);
signal reg21: std_logic_vector(31 downto 0);
signal reg22: std_logic_vector(31 downto 0);
signal reg23: std_logic_vector(31 downto 0);
signal reg24: std_logic_vector(31 downto 0);
signal reg25: std_logic_vector(31 downto 0);
signal reg26: std_logic_vector(31 downto 0);
signal reg27: std_logic_vector(31 downto 0);
signal reg28: std_logic_vector(31 downto 0);
signal reg29: std_logic_vector(31 downto 0);
signal reg30: std_logic_vector(31 downto 0);
signal reg31: std_logic_vector(31 downto 0);

begin



		mydecoder : decdr PORT MAP(write_sel, write_ena ,outputDecoder);
		
		myreg0 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(0) and write_ena) ,'0' , '0' ,reg0);
		myreg1 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(1) and write_ena) ,'0' , '0' ,reg1);
		myreg2 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(2) and write_ena) ,'0' , '0',reg2);
		myreg3 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(3) and write_ena) ,'0' , '0',reg3);
		myreg4 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(4) and write_ena) ,'0', '0',reg4);
		myreg5 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(5) and write_ena) ,'0' , '0',reg5);
		myreg6 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(6) and write_ena) ,'0' , '0',reg6);
		myreg7 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(7) and write_ena) ,'0' , '0',reg7);
		myreg8 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(8) and write_ena) ,'0' , '0',reg8);
		myreg9 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(9) and write_ena) ,'0' , '0',reg9);
		myreg10 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(10) and write_ena) ,'0' , '0',reg10);
		myreg11 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(11) and write_ena) ,'0' , '0',reg11);
		myreg12 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(12) and write_ena) ,'0' , '0',reg12);
		myreg13 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(13) and write_ena) ,'0' , '0',reg13);
		myreg14 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(14) and write_ena) ,'0' , '0',reg14);
		myreg15 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(15) and write_ena) ,'0' , '0',reg15);
		myreg16 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(16) and write_ena) ,'0' , '0',reg16);
		myreg17 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(17) and write_ena) ,'0' , '0',reg17);
		myreg18 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(18) and write_ena) ,'0' , '0',reg18);
		myreg19 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(19) and write_ena) ,'0' , '0',reg19);
		myreg20 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(20) and write_ena) ,'0' , '0',reg20);
		myreg21 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(21) and write_ena) ,'0' , '0',reg21);
		myreg22 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(22) and write_ena) ,'0' , '0',reg22);
		myreg23 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(23) and write_ena) ,'0' , '0',reg23);
		myreg24 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(24) and write_ena) ,'0', '0',reg24);
		myreg25 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(25) and write_ena) ,'0' , '0',reg25);
		myreg26 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(26) and write_ena) ,'0' , '0',reg26);
		myreg27 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(27) and write_ena) ,'0', '0',reg27);
		myreg28 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(28) and write_ena) ,'0' ,'0',reg28);
		myreg29 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(29) and write_ena) ,'0' , '0',reg29);
		myreg30 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(30) and write_ena) ,'0' , '0',reg30);
		myreg31 : reg GENERIC MAP(32) PORT MAP(write_data , clk , (outputDecoder(31) and write_ena) ,'0' , '0',reg31);
--	else
		firstMux32 : MUX32 port map( read_sel1 ,reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,reg30,reg31,data1);
		secondMux32 : MUX32 port map( read_sel2 ,reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,reg30,reg31,data2);
--	end if;
--end if;

end Behavioral;

