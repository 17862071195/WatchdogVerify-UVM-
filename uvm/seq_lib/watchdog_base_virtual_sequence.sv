`ifndef WATCHDOG_BASE_VIRTUAL_SEQUENCE_SV
`define WATCHDOG_BASE_VIRTUAL_SEQUENCE_SV
	
class watchdog_base_virtual_sequence extends uvm_sequence;
	
	apb_master_single_write_sequence    apb_wr_seq;
	apb_master_single_read_sequence     apb_rd_seq;
	apb_master_write_read_sequence      apb_wr_rd_seq;
	watchdog_reg_enable_intrt_seq       reg_enable_intr_seq;
	watchdog_reg_disable_intrt_seq      reg_disable_intr_seq;
	watchdog_reg_enable_reset_seq       reg_enable_reset_seq;
	watchdog_reg_inter_wait_clear_seq   reg_wait_clear_seq;
	watchdog_reg_load_count_seq         reg_load_count_seq;
	watchdog_reg_reload_count_seq       reg_reload_count_seq;
	
	watchdog_config cfg;
	watchdog_rgm rgm;
	bit [31:0] wr_val, rd_val;
	uvm_status_e status;
	
	`uvm_object_utils(watchdog_base_virtual_sequence)
	`uvm_declare_p_sequencer(watchdog_virtual_sequencer)
	
	function new(string name="watchdog_base_virtual_sequence");
		super.new(name);
	endfunction
	
	task body();
		`uvm_info("body", "Entered...", UVM_LOW)
		//get cfg from p_sequencer
		cfg = p_sequencer.cfg;
		rgm = cfg.rgm;		
		//TODO in sub class
		`uvm_info("body", "Exiting...", UVM_LOW)
	endtask
	
	task waite_inter_signal_asserted();
		@(posedge cfg.vif.wdgint);
	endtask
	
	task waite_inter_signal_released();
		@(negedge cfg.vif.wdgint);
	endtask
	
	task waite_reset_signal_asserted();
		@(posedge cfg.vif.wdgres);
	endtask
	
	task waite_reset_signal_released();
		@(negedge cfg.vif.wdgres);
	endtask
	
	
	virtual function void compare_data (logic[31:0] val1, logic[31:0] val2);
		p_sequencer.cfg.seq_check_count++;
		if(val1 === val2)
			`uvm_info("COMPSUC", $sformatf("vlau1 'h%0x === valu2 'h%0x", val1, val2), UVM_LOW)
		else begin
			p_sequencer.cfg.seq_check_error++;
			`uvm_error("COMPERR", $sformatf("vlau1 'h%0x !== valu2 'h%0x", val1, val2))
		end
	endfunction
	
endclass:watchdog_base_virtual_sequence

`endif 
