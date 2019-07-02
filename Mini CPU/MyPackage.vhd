--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package MyPackage is
	COMPONENT OneBitALU is
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
	end COMPONENT;
	
	COMPONENT lastOneBitALU is
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
end COMPONENT;

COMPONENT ALU is
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
end COMPONENT;


COMPONENT ALUControl is
    Port ( ALUOp0 : in  STD_LOGIC;
			  ALUOp1 : in  STD_LOGIC;
           Fun : in  STD_LOGIC_VECTOR (5 downto 0);
           Operation : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;



COMPONENT CU is
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
end COMPONENT;


COMPONENT INSTRMEMORY is
	Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
  port(
    LoadIt: in Std_logic ;
	 DATA: out STD_LOGIC_VECTOR(wordsize-1 downto 0);
    ADDRESS: in STD_LOGIC_VECTOR(addresssize-1 downto 0);
    CLK: in STD_LOGIC
    );
end COMPONENT;


COMPONENT reg IS
	GENERIC(n:NATURAL);
	PORT (
	I: IN  STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	CLK, LOD, INC, CLR: IN STD_LOGIC;
	O: OUT  STD_LOGIC_VECTOR (n-1 DOWNTO 0));
END COMPONENT;

COMPONENT DATAMEMORY is
  Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
   port ( LoadIt: in STD_LOGIC; -- not start??????
  			INPUT     : in STD_LOGIC_VECTOR (wordsize-1 downto 0);
			OUTPUT    : out STD_LOGIC_VECTOR (wordsize-1 downto 0);
         MEM_READ : in STD_LOGIC;
			MEM_WRITE : in STD_LOGIC;
			ADDRESS   : in STD_LOGIC_VECTOR (addresssize-1 downto 0);
			CLK       : in STD_LOGIC
			);

end COMPONENT;
	
COMPONENT signExtend is
    Port ( input : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;


COMPONENT shiftLeftModule is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

		
	COMPONENT twoBitMux is
		  Port ( 
			a, b : in  std_logic_vector(31 downto 0);
			selector : in std_logic;
         res : out  std_logic_vector(31 downto 0)
			 );
	end COMPONENT;
	
		
	COMPONENT twoBitMuxOneBit is
		Port ( 
			a, b : in  std_logic;
			selector : in std_logic;
         res : out  std_logic
			 );
	end COMPONENT;
	
	
	COMPONENT fourBitMux is
      Port (  andOperation : IN STD_LOGIC;
				orOperation : IN STD_LOGIC;
				addOperation : in  STD_LOGIC;
				less : IN STD_LOGIC;
           selector : in  STD_LOGIC_VECTOR(1 downto 0);
           res : out  STD_LOGIC);
	end COMPONENT;
	
	COMPONENT FullAdder is
  Port ( a , b , cin : in  STD_LOGIC;
           res , cout : out  STD_LOGIC);
	end COMPONENT;
	
	
	COMPONENT fiveBitMux is
     Port ( 
			a, b : in  std_logic_vector(4 downto 0);
			selector : in std_logic;
         res : out  std_logic_vector(4 downto 0)
			 );
	end COMPONENT;
	
	
	COMPONENT MUX32 is
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
	end COMPONENT;

	COMPONENT decdr is
    Port ( input : in  STD_LOGIC_VECTOR (4 downto 0);
		 enable : in std_logic;
           output: out  STD_LOGIC_VECTOR(31 downto 0)
          );
	end COMPONENT;


COMPONENT RegisterFile is
   Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

end MyPackage;

package body MyPackage is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end MyPackage;
