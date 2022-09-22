`ifndef WATCHDOG_REG_DISABLE_INTER_SEQ_SV
`define WATCHDOG_REG_DISABLE_INTER_SEQ_SV
	
	class watchdog_reg_disable_intrt_seq extends watchdog_base_element_sequence;
		`uvm_object_utils(watchdog_reg_disable_intrt_seq)
		function new(string name="watchdog_reg_disable_intrt_seq");
			super.new(name);
		endfunction
		task body();
			super.body();
			`uvm_info("body", "body entered..*******************************************************.", UVM_LOW)
			rgm.WDOGCONTROL.INTEN.set(1'b0);
			rgm.WDOGCONTROL.update(status);
			`uvm_info("body", "body exiting...", UVM_LOW)
		endtask
	endclass

`endif // WATCHDOG_REG_DISABLE_INTER_SEQ_SV

