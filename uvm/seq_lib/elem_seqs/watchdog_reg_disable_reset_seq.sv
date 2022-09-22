`ifndef WATCHDOG_REG_ENABLE_RESET_SEQ_SV
`define WATCHDOG_REG_ENABLE_RESET_SEQ_SV
	
	class watchdog_reg_enable_reset_seq extends watchdog_base_element_sequence;
		`uvm_object_utils(watchdog_reg_enable_reset_seq)
		function new(string name="watchdog_reg_enable_reset_seq");
			super.new(name);
		endfunction
		task body();
			super.body();
			`uvm_info("body", "body entered..*******************************************************.", UVM_LOW)
			rgm.WDOGCONTROL.RESEN.set(1'b1);
			rgm.WDOGCONTROL.update(status);
			`uvm_info("body", "body exiting...", UVM_LOW)
		endtask
	endclass

`endif // WATCHDOG_REG_ENABL_INTER_SEQ_SV