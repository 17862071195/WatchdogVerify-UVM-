`ifndef WATCHDOG_PKG_SV
`define WATCHDOG_PKG_SV

package watchdog_pkg;
  
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import apb_pkg::*;
	
	`include "watchdog_reg.svh"
	`include "watchdog_config.svh"
	
	`include "watchdog_subscriber.sv" 
	`include "watchdog_coverage.svh"
	`include "watchdog_scoreboard.sv" 
	  
  `include "watchdog_reg_adapter.sv"
  `include "watchdog_virtual_sequencer.sv"
  `include "watchdog_env.sv"
  
   `include "watchdog_element_sequences.svh"
  `include "watchdog_seq_lib.svh"
 
  `include "watchdog_tests.svh"

//  `include "./uvm/cfg/watchdog_config.svh"
//  `include "./uvm/reg/watchdog_reg.svh"
//  `include "./uvm/cov/watchdog_cov.svh"
//  
//  `include "watchdog_reg_adapter.sv"
//  `include "watchdog_virtual_sequencer.sv"
//  `include "watchdog_env.sv"
//
//  `include "./uvm/seq_lib/watchdog_seq_lib.svh"
//  `include "./uvm/test/watchdog_tests.svh"

endpackage

`endif  //WATCHDOG_PKG_sV
