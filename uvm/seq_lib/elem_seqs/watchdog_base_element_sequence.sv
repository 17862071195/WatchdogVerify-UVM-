`ifndef WATCHDOG_BASE_ELEMENT_SEQUENCE_SV
`define WATCHDOG_BASE_ELEMENT_SEQUENCE_SV
	
class watchdog_base_element_sequence extends uvm_sequence;
	
	watchdog_config cfg;
	watchdog_rgm rgm;
	bit [31:0] wr_val, rd_val;
	uvm_status_e status;
	
	`uvm_object_utils(watchdog_base_element_sequence)
	`uvm_declare_p_sequencer(watchdog_virtual_sequencer)
	
	function new(string name="watchdog_base_element_sequence");
		super.new(name);
	endfunction
	
	virtual task body();
		`uvm_info("body", "Entered...", UVM_LOW)
		//get cfg from p_sequencer
		cfg = p_sequencer.cfg;
		rgm = cfg.rgm;		
		//TODO in sub class
		
		`uvm_info("body", "Exiting...", UVM_LOW)
	endtask
	
	virtual function void compare_data (logic[31:0] val1, logic[31:0] val2);
		p_sequencer.cfg.seq_check_count++;
		if(val1 === val2)
			`uvm_info("COMPSUC", $sformatf("vlau1 'h%0x === valu2 'h%0x", val1, val2), UVM_LOW)
		else begin
			p_sequencer.cfg.seq_check_error++;
			`uvm_info("COMPERR", $sformatf("vlau1 'h%0x !== valu2 'h%0x", val1, val2), UVM_LOW)
		end
	endfunction
	
endclass:watchdog_base_element_sequence

`endif  //WATCHDOG_ELEMENT_SEQUENCES_SVH