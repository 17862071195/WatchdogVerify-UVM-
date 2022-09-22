`ifndef WATCHDOG_ELEMENT_SEQUENCES_SVH
`define WATCHDOG_ELEMENT_SEQUENCES_SVH

	`include "watchdog_base_element_sequence.sv"
	`include "watchdog_reg_enable_inter_seq.sv"
	`include "watchdog_reg_inter_wait_clear_seq.sv"
	`include "watchdog_reg_load_count_seq.sv"
	`include "watchdog_reg_reload_count_seq.sv"
	
	`include "watchdog_reg_enable_reset_seq.sv"
	`include "watchdog_reg_disable_inter_seq.sv"

`endif  //WATCHDOG_ELEMENT_SEQUENCES_SVH
