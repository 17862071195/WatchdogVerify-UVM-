`ifndef WATCHDOG_VIRTUAL_SEQUENCER_SV
`define WATCHDOG_VIRTUAL_SEQUENCER_SV

class watchdog_virtual_sequencer extends uvm_sequencer;
	
	watchdog_config cfg;
	
	apb_master_sequencer apb_mst_sqr;
	 
	`uvm_component_utils(watchdog_virtual_sequencer)
	
	function new(string name="watchdog_virtual_sequencer", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(watchdog_config)::get(this, "", "wdog_cfg", cfg))
			`uvm_fatal("GETCFG", "watchdog_virtual_sequencer can't get the watchdog_config from env")
		
	endfunction
endclass

`endif