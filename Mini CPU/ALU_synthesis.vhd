--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.58f
--  \   \         Application: netgen
--  /   /         Filename: ALU_synthesis.vhd
-- /___/   /\     Timestamp: Wed Apr 10 16:08:01 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm ALU -w -dir netgen/synthesis -ofmt vhdl -sim ALU.ngc ALU_synthesis.vhd 
-- Device	: xc7a100t-3-csg324
-- Input file	: ALU.ngc
-- Output file	: F:\FCIS\Third Year\Second Term\Archi\Milestone1\milestone1\netgen\synthesis\ALU_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: ALU
-- Xilinx	: C:\Xilinx\14.5\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity ALU is
  port (
    cin : in STD_LOGIC := 'X'; 
    cflag : out STD_LOGIC; 
    zflag : out STD_LOGIC; 
    oflag : out STD_LOGIC; 
    data1 : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    data2 : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    aluop : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
    dataout : out STD_LOGIC_VECTOR ( 31 downto 0 ) 
  );
end ALU;

architecture Structure of ALU is
  signal data1_0_IBUF_0 : STD_LOGIC; 
  signal data2_0_IBUF_1 : STD_LOGIC; 
  signal aluop_3_IBUF_2 : STD_LOGIC; 
  signal aluop_2_IBUF_3 : STD_LOGIC; 
  signal aluop_1_IBUF_4 : STD_LOGIC; 
  signal aluop_0_IBUF_5 : STD_LOGIC; 
  signal alu0_dataout_6 : STD_LOGIC; 
  signal cflag_OBUF_7 : STD_LOGIC; 
  signal alu0_aluop_3_aluop_3_OR_8_o : STD_LOGIC; 
  signal alu0_n0029 : STD_LOGIC; 
begin
  alu0_dataout : LD
    port map (
      D => alu0_n0029,
      G => alu0_aluop_3_aluop_3_OR_8_o,
      Q => alu0_dataout_6
    );
  alu0_Madd_res_Madd_cy_0_1 : LUT3
    generic map(
      INIT => X"E2"
    )
    port map (
      I0 => aluop_2_IBUF_3,
      I1 => data2_0_IBUF_1,
      I2 => data1_0_IBUF_0,
      O => cflag_OBUF_7
    );
  alu0_n00291 : LUT5
    generic map(
      INIT => X"66666E68"
    )
    port map (
      I0 => data2_0_IBUF_1,
      I1 => data1_0_IBUF_0,
      I2 => aluop_2_IBUF_3,
      I3 => aluop_0_IBUF_5,
      I4 => aluop_1_IBUF_4,
      O => alu0_n0029
    );
  alu0_aluop_3_aluop_3_OR_8_o1 : LUT4
    generic map(
      INIT => X"0145"
    )
    port map (
      I0 => aluop_3_IBUF_2,
      I1 => aluop_1_IBUF_4,
      I2 => aluop_2_IBUF_3,
      I3 => aluop_0_IBUF_5,
      O => alu0_aluop_3_aluop_3_OR_8_o
    );
  data1_0_IBUF : IBUF
    port map (
      I => data1(0),
      O => data1_0_IBUF_0
    );
  data2_0_IBUF : IBUF
    port map (
      I => data2(0),
      O => data2_0_IBUF_1
    );
  aluop_3_IBUF : IBUF
    port map (
      I => aluop(3),
      O => aluop_3_IBUF_2
    );
  aluop_2_IBUF : IBUF
    port map (
      I => aluop(2),
      O => aluop_2_IBUF_3
    );
  aluop_1_IBUF : IBUF
    port map (
      I => aluop(1),
      O => aluop_1_IBUF_4
    );
  aluop_0_IBUF : IBUF
    port map (
      I => aluop(0),
      O => aluop_0_IBUF_5
    );
  dataout_0_OBUF : OBUF
    port map (
      I => alu0_dataout_6,
      O => dataout(0)
    );
  cflag_OBUF : OBUF
    port map (
      I => cflag_OBUF_7,
      O => cflag
    );

end Structure;

