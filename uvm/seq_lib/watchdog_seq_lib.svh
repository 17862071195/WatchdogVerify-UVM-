`ifndef WATCHDOG_SEQ_LIB_SVH
`define WATCHDOG_SEQ_LIB_SVH

	`include "watchdog_base_virtual_sequence.sv"
	`include "watchdog_integration_virtual_sequence.sv"
	`include "watchdog_apbacc_virtual_sequence.sv"
	`include "watchdog_regacc_virtual_sequence.sv"
		
	`include "watchdog_countdown_virtual_sequence.sv"
	`include "watchdog_reload_virtual_sequence.sv"
	`include "watchdog_resen_virtual_sequence.sv"
	`include "watchdog_disable_inter_virtual_sequence.sv"
	`include "watchdog_lock_virtual_sequence.sv"
	`include "watchdog_PeripheralID_check_virtual_sequence.sv"
`endif 
