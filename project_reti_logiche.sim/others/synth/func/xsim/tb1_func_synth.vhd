-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Sun Apr 30 18:15:49 2023
-- Host        : LAPTOP-4J4IK2F8 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {C:/Users/simon/OneDrive - Politecnico di Milano/3/Reti
--               Logiche/project_reti_logiche/project_reti_logiche.sim/others/synth/func/xsim/tb1_func_synth.vhd}
-- Design      : project_reti_logiche
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DataSwitch is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    o_z3_OBUF : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_z2_OBUF : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_z1_OBUF : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_z0_OBUF : out STD_LOGIC_VECTOR ( 7 downto 0 );
    channel : in STD_LOGIC_VECTOR ( 1 downto 0 );
    o_mem_en_OBUF : in STD_LOGIC;
    i_mem_data_IBUF : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end DataSwitch;

architecture STRUCTURE of DataSwitch is
  signal \FSM_onehot_mode[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_mode_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_mode_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_mode_reg_n_0_[3]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal internal_z0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \internal_z0[7]_i_1_n_0\ : STD_LOGIC;
  signal internal_z1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal internal_z1_1 : STD_LOGIC;
  signal internal_z2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal internal_z2_2 : STD_LOGIC;
  signal internal_z3 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \internal_z3[0]_i_1_n_0\ : STD_LOGIC;
  signal \internal_z3[1]_i_1_n_0\ : STD_LOGIC;
  signal \internal_z3[2]_i_1_n_0\ : STD_LOGIC;
  signal \internal_z3[3]_i_1_n_0\ : STD_LOGIC;
  signal \internal_z3[4]_i_1_n_0\ : STD_LOGIC;
  signal \internal_z3[5]_i_1_n_0\ : STD_LOGIC;
  signal \internal_z3[6]_i_1_n_0\ : STD_LOGIC;
  signal \internal_z3[7]_i_2_n_0\ : STD_LOGIC;
  signal internal_z3_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_mode[1]_i_1\ : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_mode_reg[0]\ : label is "rst:00001,save:01000,show:10000,wait_input:00010,wait_data:00100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_mode_reg[1]\ : label is "rst:00001,save:01000,show:10000,wait_input:00010,wait_data:00100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_mode_reg[2]\ : label is "rst:00001,save:01000,show:10000,wait_input:00010,wait_data:00100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_mode_reg[3]\ : label is "rst:00001,save:01000,show:10000,wait_input:00010,wait_data:00100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_mode_reg[4]\ : label is "rst:00001,save:01000,show:10000,wait_input:00010,wait_data:00100";
  attribute SOFT_HLUTNM of \internal_z3[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \internal_z3[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \internal_z3[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \internal_z3[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \internal_z3[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \internal_z3[5]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \internal_z3[6]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \internal_z3[7]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \o_z0_OBUF[0]_inst_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \o_z0_OBUF[1]_inst_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \o_z0_OBUF[2]_inst_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \o_z0_OBUF[3]_inst_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \o_z0_OBUF[4]_inst_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \o_z0_OBUF[5]_inst_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \o_z0_OBUF[6]_inst_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \o_z1_OBUF[0]_inst_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \o_z1_OBUF[1]_inst_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \o_z1_OBUF[2]_inst_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \o_z1_OBUF[3]_inst_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \o_z1_OBUF[4]_inst_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \o_z1_OBUF[5]_inst_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \o_z1_OBUF[6]_inst_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \o_z1_OBUF[7]_inst_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \o_z2_OBUF[0]_inst_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \o_z2_OBUF[1]_inst_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \o_z2_OBUF[2]_inst_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \o_z2_OBUF[3]_inst_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \o_z2_OBUF[4]_inst_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \o_z2_OBUF[5]_inst_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \o_z2_OBUF[6]_inst_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \o_z2_OBUF[7]_inst_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \o_z3_OBUF[0]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \o_z3_OBUF[1]_inst_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \o_z3_OBUF[2]_inst_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \o_z3_OBUF[3]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \o_z3_OBUF[4]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \o_z3_OBUF[5]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \o_z3_OBUF[6]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \o_z3_OBUF[7]_inst_i_1\ : label is "soft_lutpair8";
begin
  Q(1 downto 0) <= \^q\(1 downto 0);
\FSM_onehot_mode[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAE"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[0]\,
      I1 => \^q\(0),
      I2 => o_mem_en_OBUF,
      I3 => \^q\(1),
      O => \FSM_onehot_mode[1]_i_1_n_0\
    );
\FSM_onehot_mode_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => '0',
      Q => \FSM_onehot_mode_reg_n_0_[0]\,
      S => SR(0)
    );
\FSM_onehot_mode_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \FSM_onehot_mode[1]_i_1_n_0\,
      Q => \^q\(0),
      R => SR(0)
    );
\FSM_onehot_mode_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(0),
      Q => \FSM_onehot_mode_reg_n_0_[2]\,
      R => SR(0)
    );
\FSM_onehot_mode_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \FSM_onehot_mode_reg_n_0_[2]\,
      Q => \FSM_onehot_mode_reg_n_0_[3]\,
      R => SR(0)
    );
\FSM_onehot_mode_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \FSM_onehot_mode_reg_n_0_[3]\,
      Q => \^q\(1),
      R => SR(0)
    );
\internal_z0[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABAA"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[0]\,
      I1 => channel(0),
      I2 => channel(1),
      I3 => \FSM_onehot_mode_reg_n_0_[3]\,
      O => \internal_z0[7]_i_1_n_0\
    );
\internal_z0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal_z0[7]_i_1_n_0\,
      D => \internal_z3[0]_i_1_n_0\,
      Q => internal_z0(0),
      R => SR(0)
    );
\internal_z0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal_z0[7]_i_1_n_0\,
      D => \internal_z3[1]_i_1_n_0\,
      Q => internal_z0(1),
      R => SR(0)
    );
\internal_z0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal_z0[7]_i_1_n_0\,
      D => \internal_z3[2]_i_1_n_0\,
      Q => internal_z0(2),
      R => SR(0)
    );
\internal_z0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal_z0[7]_i_1_n_0\,
      D => \internal_z3[3]_i_1_n_0\,
      Q => internal_z0(3),
      R => SR(0)
    );
\internal_z0_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal_z0[7]_i_1_n_0\,
      D => \internal_z3[4]_i_1_n_0\,
      Q => internal_z0(4),
      R => SR(0)
    );
\internal_z0_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal_z0[7]_i_1_n_0\,
      D => \internal_z3[5]_i_1_n_0\,
      Q => internal_z0(5),
      R => SR(0)
    );
\internal_z0_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal_z0[7]_i_1_n_0\,
      D => \internal_z3[6]_i_1_n_0\,
      Q => internal_z0(6),
      R => SR(0)
    );
\internal_z0_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal_z0[7]_i_1_n_0\,
      D => \internal_z3[7]_i_2_n_0\,
      Q => internal_z0(7),
      R => SR(0)
    );
\internal_z1[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AEAA"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[0]\,
      I1 => channel(0),
      I2 => channel(1),
      I3 => \FSM_onehot_mode_reg_n_0_[3]\,
      O => internal_z1_1
    );
\internal_z1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z1_1,
      D => \internal_z3[0]_i_1_n_0\,
      Q => internal_z1(0),
      R => SR(0)
    );
\internal_z1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z1_1,
      D => \internal_z3[1]_i_1_n_0\,
      Q => internal_z1(1),
      R => SR(0)
    );
\internal_z1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z1_1,
      D => \internal_z3[2]_i_1_n_0\,
      Q => internal_z1(2),
      R => SR(0)
    );
\internal_z1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z1_1,
      D => \internal_z3[3]_i_1_n_0\,
      Q => internal_z1(3),
      R => SR(0)
    );
\internal_z1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z1_1,
      D => \internal_z3[4]_i_1_n_0\,
      Q => internal_z1(4),
      R => SR(0)
    );
\internal_z1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z1_1,
      D => \internal_z3[5]_i_1_n_0\,
      Q => internal_z1(5),
      R => SR(0)
    );
\internal_z1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z1_1,
      D => \internal_z3[6]_i_1_n_0\,
      Q => internal_z1(6),
      R => SR(0)
    );
\internal_z1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z1_1,
      D => \internal_z3[7]_i_2_n_0\,
      Q => internal_z1(7),
      R => SR(0)
    );
\internal_z2[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AEAA"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[0]\,
      I1 => channel(1),
      I2 => channel(0),
      I3 => \FSM_onehot_mode_reg_n_0_[3]\,
      O => internal_z2_2
    );
\internal_z2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z2_2,
      D => \internal_z3[0]_i_1_n_0\,
      Q => internal_z2(0),
      R => SR(0)
    );
\internal_z2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z2_2,
      D => \internal_z3[1]_i_1_n_0\,
      Q => internal_z2(1),
      R => SR(0)
    );
\internal_z2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z2_2,
      D => \internal_z3[2]_i_1_n_0\,
      Q => internal_z2(2),
      R => SR(0)
    );
\internal_z2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z2_2,
      D => \internal_z3[3]_i_1_n_0\,
      Q => internal_z2(3),
      R => SR(0)
    );
\internal_z2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z2_2,
      D => \internal_z3[4]_i_1_n_0\,
      Q => internal_z2(4),
      R => SR(0)
    );
\internal_z2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z2_2,
      D => \internal_z3[5]_i_1_n_0\,
      Q => internal_z2(5),
      R => SR(0)
    );
\internal_z2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z2_2,
      D => \internal_z3[6]_i_1_n_0\,
      Q => internal_z2(6),
      R => SR(0)
    );
\internal_z2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z2_2,
      D => \internal_z3[7]_i_2_n_0\,
      Q => internal_z2(7),
      R => SR(0)
    );
\internal_z3[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[3]\,
      I1 => i_mem_data_IBUF(0),
      O => \internal_z3[0]_i_1_n_0\
    );
\internal_z3[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[3]\,
      I1 => i_mem_data_IBUF(1),
      O => \internal_z3[1]_i_1_n_0\
    );
\internal_z3[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[3]\,
      I1 => i_mem_data_IBUF(2),
      O => \internal_z3[2]_i_1_n_0\
    );
\internal_z3[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[3]\,
      I1 => i_mem_data_IBUF(3),
      O => \internal_z3[3]_i_1_n_0\
    );
\internal_z3[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[3]\,
      I1 => i_mem_data_IBUF(4),
      O => \internal_z3[4]_i_1_n_0\
    );
\internal_z3[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[3]\,
      I1 => i_mem_data_IBUF(5),
      O => \internal_z3[5]_i_1_n_0\
    );
\internal_z3[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[3]\,
      I1 => i_mem_data_IBUF(6),
      O => \internal_z3[6]_i_1_n_0\
    );
\internal_z3[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EAAA"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[0]\,
      I1 => channel(0),
      I2 => channel(1),
      I3 => \FSM_onehot_mode_reg_n_0_[3]\,
      O => internal_z3_0
    );
\internal_z3[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_mode_reg_n_0_[3]\,
      I1 => i_mem_data_IBUF(7),
      O => \internal_z3[7]_i_2_n_0\
    );
\internal_z3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z3_0,
      D => \internal_z3[0]_i_1_n_0\,
      Q => internal_z3(0),
      R => SR(0)
    );
\internal_z3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z3_0,
      D => \internal_z3[1]_i_1_n_0\,
      Q => internal_z3(1),
      R => SR(0)
    );
\internal_z3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z3_0,
      D => \internal_z3[2]_i_1_n_0\,
      Q => internal_z3(2),
      R => SR(0)
    );
\internal_z3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z3_0,
      D => \internal_z3[3]_i_1_n_0\,
      Q => internal_z3(3),
      R => SR(0)
    );
\internal_z3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z3_0,
      D => \internal_z3[4]_i_1_n_0\,
      Q => internal_z3(4),
      R => SR(0)
    );
\internal_z3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z3_0,
      D => \internal_z3[5]_i_1_n_0\,
      Q => internal_z3(5),
      R => SR(0)
    );
\internal_z3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z3_0,
      D => \internal_z3[6]_i_1_n_0\,
      Q => internal_z3(6),
      R => SR(0)
    );
\internal_z3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_z3_0,
      D => \internal_z3[7]_i_2_n_0\,
      Q => internal_z3(7),
      R => SR(0)
    );
\o_z0_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z0(0),
      O => o_z0_OBUF(0)
    );
\o_z0_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z0(1),
      O => o_z0_OBUF(1)
    );
\o_z0_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z0(2),
      O => o_z0_OBUF(2)
    );
\o_z0_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z0(3),
      O => o_z0_OBUF(3)
    );
\o_z0_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z0(4),
      O => o_z0_OBUF(4)
    );
\o_z0_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z0(5),
      O => o_z0_OBUF(5)
    );
\o_z0_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z0(6),
      O => o_z0_OBUF(6)
    );
\o_z0_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z0(7),
      O => o_z0_OBUF(7)
    );
\o_z1_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z1(0),
      O => o_z1_OBUF(0)
    );
\o_z1_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z1(1),
      O => o_z1_OBUF(1)
    );
\o_z1_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z1(2),
      O => o_z1_OBUF(2)
    );
\o_z1_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z1(3),
      O => o_z1_OBUF(3)
    );
\o_z1_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z1(4),
      O => o_z1_OBUF(4)
    );
\o_z1_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z1(5),
      O => o_z1_OBUF(5)
    );
\o_z1_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z1(6),
      O => o_z1_OBUF(6)
    );
\o_z1_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z1(7),
      O => o_z1_OBUF(7)
    );
\o_z2_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z2(0),
      O => o_z2_OBUF(0)
    );
\o_z2_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z2(1),
      O => o_z2_OBUF(1)
    );
\o_z2_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z2(2),
      O => o_z2_OBUF(2)
    );
\o_z2_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z2(3),
      O => o_z2_OBUF(3)
    );
\o_z2_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z2(4),
      O => o_z2_OBUF(4)
    );
\o_z2_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z2(5),
      O => o_z2_OBUF(5)
    );
\o_z2_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z2(6),
      O => o_z2_OBUF(6)
    );
\o_z2_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z2(7),
      O => o_z2_OBUF(7)
    );
\o_z3_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z3(0),
      O => o_z3_OBUF(0)
    );
\o_z3_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z3(1),
      O => o_z3_OBUF(1)
    );
\o_z3_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z3(2),
      O => o_z3_OBUF(2)
    );
\o_z3_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z3(3),
      O => o_z3_OBUF(3)
    );
\o_z3_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z3(4),
      O => o_z3_OBUF(4)
    );
\o_z3_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z3(5),
      O => o_z3_OBUF(5)
    );
\o_z3_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z3(6),
      O => o_z3_OBUF(6)
    );
\o_z3_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(1),
      I1 => internal_z3(7),
      O => o_z3_OBUF(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DeSerializeTransform is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    o_mem_en_OBUF : out STD_LOGIC;
    \internal_out_address_reg[15]_0\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    channel : out STD_LOGIC_VECTOR ( 1 downto 0 );
    i_start_IBUF : in STD_LOGIC;
    i_w_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC
  );
end DeSerializeTransform;

architecture STRUCTURE of DeSerializeTransform is
  signal \^channel\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \internal_channel[0]_i_1_n_0\ : STD_LOGIC;
  signal \internal_channel[1]_i_1_n_0\ : STD_LOGIC;
  signal internal_out_address : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal internal_out_address_0 : STD_LOGIC;
  signal \^internal_out_address_reg[15]_0\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal mode : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \mode__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_mode[2]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \FSM_sequential_mode[0]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \FSM_sequential_mode[1]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \FSM_sequential_mode[2]_i_1\ : label is "soft_lutpair22";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_mode_reg[0]\ : label is "rst:000,get_ch0:011,wait_input:001,get_ch1:010,get_add:100,send_input:101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_mode_reg[1]\ : label is "rst:000,get_ch0:011,wait_input:001,get_ch1:010,get_add:100,send_input:101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_mode_reg[2]\ : label is "rst:000,get_ch0:011,wait_input:001,get_ch1:010,get_add:100,send_input:101";
  attribute SOFT_HLUTNM of \internal_out_address[0]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \internal_out_address[10]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \internal_out_address[11]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \internal_out_address[12]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \internal_out_address[13]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \internal_out_address[14]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \internal_out_address[1]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \internal_out_address[2]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \internal_out_address[3]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \internal_out_address[4]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \internal_out_address[5]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \internal_out_address[6]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \internal_out_address[7]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \internal_out_address[8]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \internal_out_address[9]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of o_mem_en_OBUF_inst_i_1 : label is "soft_lutpair20";
begin
  channel(1 downto 0) <= \^channel\(1 downto 0);
  \internal_out_address_reg[15]_0\(15 downto 0) <= \^internal_out_address_reg[15]_0\(15 downto 0);
\FSM_onehot_mode[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008808"
    )
        port map (
      I0 => Q(0),
      I1 => mode(2),
      I2 => i_start_IBUF,
      I3 => mode(0),
      I4 => mode(1),
      O => D(0)
    );
\FSM_sequential_mode[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"05B3"
    )
        port map (
      I0 => mode(0),
      I1 => i_start_IBUF,
      I2 => mode(2),
      I3 => mode(1),
      O => \mode__0\(0)
    );
\FSM_sequential_mode[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0454"
    )
        port map (
      I0 => mode(2),
      I1 => i_start_IBUF,
      I2 => mode(1),
      I3 => mode(0),
      O => \mode__0\(1)
    );
\FSM_sequential_mode[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"24"
    )
        port map (
      I0 => mode(0),
      I1 => mode(2),
      I2 => mode(1),
      O => \mode__0\(2)
    );
\FSM_sequential_mode_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \mode__0\(0),
      Q => mode(0),
      R => SR(0)
    );
\FSM_sequential_mode_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \mode__0\(1),
      Q => mode(1),
      R => SR(0)
    );
\FSM_sequential_mode_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \mode__0\(2),
      Q => mode(2),
      R => SR(0)
    );
\internal_channel[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFAC000000A0"
    )
        port map (
      I0 => i_w_IBUF,
      I1 => i_start_IBUF,
      I2 => mode(1),
      I3 => mode(2),
      I4 => mode(0),
      I5 => \^channel\(0),
      O => \internal_channel[0]_i_1_n_0\
    );
\internal_channel[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFAC000000A0"
    )
        port map (
      I0 => i_w_IBUF,
      I1 => mode(0),
      I2 => i_start_IBUF,
      I3 => mode(2),
      I4 => mode(1),
      I5 => \^channel\(1),
      O => \internal_channel[1]_i_1_n_0\
    );
\internal_channel_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \internal_channel[0]_i_1_n_0\,
      Q => \^channel\(0),
      R => SR(0)
    );
\internal_channel_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \internal_channel[1]_i_1_n_0\,
      Q => \^channel\(1),
      R => SR(0)
    );
\internal_out_address[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F800000"
    )
        port map (
      I0 => mode(0),
      I1 => i_start_IBUF,
      I2 => mode(1),
      I3 => mode(2),
      I4 => i_w_IBUF,
      O => internal_out_address(0)
    );
\internal_out_address[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(9),
      I2 => mode(2),
      O => internal_out_address(10)
    );
\internal_out_address[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(10),
      I2 => mode(2),
      O => internal_out_address(11)
    );
\internal_out_address[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(11),
      I2 => mode(2),
      O => internal_out_address(12)
    );
\internal_out_address[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(12),
      I2 => mode(2),
      O => internal_out_address(13)
    );
\internal_out_address[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(13),
      I2 => mode(2),
      O => internal_out_address(14)
    );
\internal_out_address[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5755"
    )
        port map (
      I0 => mode(2),
      I1 => mode(1),
      I2 => mode(0),
      I3 => i_start_IBUF,
      O => internal_out_address_0
    );
\internal_out_address[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(14),
      I2 => mode(2),
      O => internal_out_address(15)
    );
\internal_out_address[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(0),
      I2 => mode(2),
      O => internal_out_address(1)
    );
\internal_out_address[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(1),
      I2 => mode(2),
      O => internal_out_address(2)
    );
\internal_out_address[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(2),
      I2 => mode(2),
      O => internal_out_address(3)
    );
\internal_out_address[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(3),
      I2 => mode(2),
      O => internal_out_address(4)
    );
\internal_out_address[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(4),
      I2 => mode(2),
      O => internal_out_address(5)
    );
\internal_out_address[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(5),
      I2 => mode(2),
      O => internal_out_address(6)
    );
\internal_out_address[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(6),
      I2 => mode(2),
      O => internal_out_address(7)
    );
\internal_out_address[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(7),
      I2 => mode(2),
      O => internal_out_address(8)
    );
\internal_out_address[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mode(1),
      I1 => \^internal_out_address_reg[15]_0\(8),
      I2 => mode(2),
      O => internal_out_address(9)
    );
\internal_out_address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(0),
      Q => \^internal_out_address_reg[15]_0\(0),
      R => SR(0)
    );
\internal_out_address_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(10),
      Q => \^internal_out_address_reg[15]_0\(10),
      R => SR(0)
    );
\internal_out_address_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(11),
      Q => \^internal_out_address_reg[15]_0\(11),
      R => SR(0)
    );
\internal_out_address_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(12),
      Q => \^internal_out_address_reg[15]_0\(12),
      R => SR(0)
    );
\internal_out_address_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(13),
      Q => \^internal_out_address_reg[15]_0\(13),
      R => SR(0)
    );
\internal_out_address_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(14),
      Q => \^internal_out_address_reg[15]_0\(14),
      R => SR(0)
    );
\internal_out_address_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(15),
      Q => \^internal_out_address_reg[15]_0\(15),
      R => SR(0)
    );
\internal_out_address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(1),
      Q => \^internal_out_address_reg[15]_0\(1),
      R => SR(0)
    );
\internal_out_address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(2),
      Q => \^internal_out_address_reg[15]_0\(2),
      R => SR(0)
    );
\internal_out_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(3),
      Q => \^internal_out_address_reg[15]_0\(3),
      R => SR(0)
    );
\internal_out_address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(4),
      Q => \^internal_out_address_reg[15]_0\(4),
      R => SR(0)
    );
\internal_out_address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(5),
      Q => \^internal_out_address_reg[15]_0\(5),
      R => SR(0)
    );
\internal_out_address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(6),
      Q => \^internal_out_address_reg[15]_0\(6),
      R => SR(0)
    );
\internal_out_address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(7),
      Q => \^internal_out_address_reg[15]_0\(7),
      R => SR(0)
    );
\internal_out_address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(8),
      Q => \^internal_out_address_reg[15]_0\(8),
      R => SR(0)
    );
\internal_out_address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => internal_out_address_0,
      D => internal_out_address(9),
      Q => \^internal_out_address_reg[15]_0\(9),
      R => SR(0)
    );
o_mem_en_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4500"
    )
        port map (
      I0 => mode(1),
      I1 => mode(0),
      I2 => i_start_IBUF,
      I3 => mode(2),
      O => o_mem_en_OBUF
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity project_reti_logiche is
  port (
    i_clk : in STD_LOGIC;
    i_rst : in STD_LOGIC;
    i_start : in STD_LOGIC;
    i_w : in STD_LOGIC;
    o_z0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_z1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_z2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_z3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_done : out STD_LOGIC;
    o_mem_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    i_mem_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    o_mem_we : out STD_LOGIC;
    o_mem_en : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of project_reti_logiche : entity is true;
end project_reti_logiche;

architecture STRUCTURE of project_reti_logiche is
  signal DS_n_1 : STD_LOGIC;
  signal DeSerT_n_0 : STD_LOGIC;
  signal channel : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal i_clk_IBUF : STD_LOGIC;
  signal i_clk_IBUF_BUFG : STD_LOGIC;
  signal i_mem_data_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal i_rst_IBUF : STD_LOGIC;
  signal i_start_IBUF : STD_LOGIC;
  signal i_w_IBUF : STD_LOGIC;
  signal o_done_OBUF : STD_LOGIC;
  signal o_mem_addr_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal o_mem_en_OBUF : STD_LOGIC;
  signal o_z0_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal o_z1_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal o_z2_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal o_z3_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
DS: entity work.DataSwitch
     port map (
      CLK => i_clk_IBUF_BUFG,
      D(0) => DeSerT_n_0,
      Q(1) => o_done_OBUF,
      Q(0) => DS_n_1,
      SR(0) => i_rst_IBUF,
      channel(1 downto 0) => channel(1 downto 0),
      i_mem_data_IBUF(7 downto 0) => i_mem_data_IBUF(7 downto 0),
      o_mem_en_OBUF => o_mem_en_OBUF,
      o_z0_OBUF(7 downto 0) => o_z0_OBUF(7 downto 0),
      o_z1_OBUF(7 downto 0) => o_z1_OBUF(7 downto 0),
      o_z2_OBUF(7 downto 0) => o_z2_OBUF(7 downto 0),
      o_z3_OBUF(7 downto 0) => o_z3_OBUF(7 downto 0)
    );
DeSerT: entity work.DeSerializeTransform
     port map (
      CLK => i_clk_IBUF_BUFG,
      D(0) => DeSerT_n_0,
      Q(0) => DS_n_1,
      SR(0) => i_rst_IBUF,
      channel(1 downto 0) => channel(1 downto 0),
      i_start_IBUF => i_start_IBUF,
      i_w_IBUF => i_w_IBUF,
      \internal_out_address_reg[15]_0\(15 downto 0) => o_mem_addr_OBUF(15 downto 0),
      o_mem_en_OBUF => o_mem_en_OBUF
    );
i_clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => i_clk_IBUF,
      O => i_clk_IBUF_BUFG
    );
i_clk_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_clk,
      O => i_clk_IBUF
    );
\i_mem_data_IBUF[0]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(0),
      O => i_mem_data_IBUF(0)
    );
\i_mem_data_IBUF[1]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(1),
      O => i_mem_data_IBUF(1)
    );
\i_mem_data_IBUF[2]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(2),
      O => i_mem_data_IBUF(2)
    );
\i_mem_data_IBUF[3]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(3),
      O => i_mem_data_IBUF(3)
    );
\i_mem_data_IBUF[4]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(4),
      O => i_mem_data_IBUF(4)
    );
\i_mem_data_IBUF[5]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(5),
      O => i_mem_data_IBUF(5)
    );
\i_mem_data_IBUF[6]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(6),
      O => i_mem_data_IBUF(6)
    );
\i_mem_data_IBUF[7]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(7),
      O => i_mem_data_IBUF(7)
    );
i_rst_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_rst,
      O => i_rst_IBUF
    );
i_start_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_start,
      O => i_start_IBUF
    );
i_w_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_w,
      O => i_w_IBUF
    );
o_done_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_done_OBUF,
      O => o_done
    );
\o_mem_addr_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(0),
      O => o_mem_addr(0)
    );
\o_mem_addr_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(10),
      O => o_mem_addr(10)
    );
\o_mem_addr_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(11),
      O => o_mem_addr(11)
    );
\o_mem_addr_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(12),
      O => o_mem_addr(12)
    );
\o_mem_addr_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(13),
      O => o_mem_addr(13)
    );
\o_mem_addr_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(14),
      O => o_mem_addr(14)
    );
\o_mem_addr_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(15),
      O => o_mem_addr(15)
    );
\o_mem_addr_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(1),
      O => o_mem_addr(1)
    );
\o_mem_addr_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(2),
      O => o_mem_addr(2)
    );
\o_mem_addr_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(3),
      O => o_mem_addr(3)
    );
\o_mem_addr_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(4),
      O => o_mem_addr(4)
    );
\o_mem_addr_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(5),
      O => o_mem_addr(5)
    );
\o_mem_addr_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(6),
      O => o_mem_addr(6)
    );
\o_mem_addr_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(7),
      O => o_mem_addr(7)
    );
\o_mem_addr_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(8),
      O => o_mem_addr(8)
    );
\o_mem_addr_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(9),
      O => o_mem_addr(9)
    );
o_mem_en_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_mem_en_OBUF,
      O => o_mem_en
    );
o_mem_we_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_mem_we
    );
\o_z0_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(0),
      O => o_z0(0)
    );
\o_z0_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(1),
      O => o_z0(1)
    );
\o_z0_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(2),
      O => o_z0(2)
    );
\o_z0_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(3),
      O => o_z0(3)
    );
\o_z0_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(4),
      O => o_z0(4)
    );
\o_z0_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(5),
      O => o_z0(5)
    );
\o_z0_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(6),
      O => o_z0(6)
    );
\o_z0_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(7),
      O => o_z0(7)
    );
\o_z1_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(0),
      O => o_z1(0)
    );
\o_z1_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(1),
      O => o_z1(1)
    );
\o_z1_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(2),
      O => o_z1(2)
    );
\o_z1_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(3),
      O => o_z1(3)
    );
\o_z1_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(4),
      O => o_z1(4)
    );
\o_z1_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(5),
      O => o_z1(5)
    );
\o_z1_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(6),
      O => o_z1(6)
    );
\o_z1_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(7),
      O => o_z1(7)
    );
\o_z2_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(0),
      O => o_z2(0)
    );
\o_z2_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(1),
      O => o_z2(1)
    );
\o_z2_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(2),
      O => o_z2(2)
    );
\o_z2_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(3),
      O => o_z2(3)
    );
\o_z2_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(4),
      O => o_z2(4)
    );
\o_z2_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(5),
      O => o_z2(5)
    );
\o_z2_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(6),
      O => o_z2(6)
    );
\o_z2_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(7),
      O => o_z2(7)
    );
\o_z3_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(0),
      O => o_z3(0)
    );
\o_z3_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(1),
      O => o_z3(1)
    );
\o_z3_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(2),
      O => o_z3(2)
    );
\o_z3_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(3),
      O => o_z3(3)
    );
\o_z3_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(4),
      O => o_z3(4)
    );
\o_z3_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(5),
      O => o_z3(5)
    );
\o_z3_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(6),
      O => o_z3(6)
    );
\o_z3_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(7),
      O => o_z3(7)
    );
end STRUCTURE;
