-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "10/05/2018 16:34:22"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	divi_freq IS
    PORT (
	clock_in : IN std_logic;
	clock_out : OUT std_logic
	);
END divi_freq;

-- Design Ports Information
-- clock_out	=>  Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clock_in	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF divi_freq IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock_in : std_logic;
SIGNAL ww_clock_out : std_logic;
SIGNAL \clock_in~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clock_in~combout\ : std_logic;
SIGNAL \clock_in~clkctrl_outclk\ : std_logic;
SIGNAL \contagem~2_combout\ : std_logic;
SIGNAL \contagem~0_combout\ : std_logic;
SIGNAL \contagem~1_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \estado~regout\ : std_logic;
SIGNAL contagem : std_logic_vector(2 DOWNTO 0);

BEGIN

ww_clock_in <= clock_in;
clock_out <= ww_clock_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock_in~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clock_in~combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clock_in~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clock_in,
	combout => \clock_in~combout\);

-- Location: CLKCTRL_G3
\clock_in~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock_in~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock_in~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y25_N14
\contagem~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \contagem~2_combout\ = (!contagem(0) & ((contagem(1)) # (!contagem(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contagem(2),
	datac => contagem(0),
	datad => contagem(1),
	combout => \contagem~2_combout\);

-- Location: LCFF_X1_Y25_N15
\contagem[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock_in~clkctrl_outclk\,
	datain => \contagem~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contagem(0));

-- Location: LCCOMB_X1_Y25_N30
\contagem~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \contagem~0_combout\ = (contagem(2) & ((contagem(0)))) # (!contagem(2) & (contagem(1) & !contagem(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contagem(1),
	datac => contagem(2),
	datad => contagem(0),
	combout => \contagem~0_combout\);

-- Location: LCFF_X1_Y25_N31
\contagem[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock_in~clkctrl_outclk\,
	datain => \contagem~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contagem(2));

-- Location: LCCOMB_X1_Y25_N28
\contagem~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \contagem~1_combout\ = (contagem(1) & ((contagem(0)))) # (!contagem(1) & (!contagem(2) & !contagem(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contagem(2),
	datac => contagem(1),
	datad => contagem(0),
	combout => \contagem~1_combout\);

-- Location: LCFF_X1_Y25_N29
\contagem[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock_in~clkctrl_outclk\,
	datain => \contagem~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => contagem(1));

-- Location: LCCOMB_X1_Y25_N20
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!contagem(1) & (!contagem(0) & contagem(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contagem(1),
	datac => contagem(0),
	datad => contagem(2),
	combout => \Equal0~0_combout\);

-- Location: LCFF_X1_Y25_N21
estado : cycloneii_lcell_ff
PORT MAP (
	clk => \clock_in~clkctrl_outclk\,
	datain => \Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado~regout\);

-- Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\clock_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \estado~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_clock_out);
END structure;


