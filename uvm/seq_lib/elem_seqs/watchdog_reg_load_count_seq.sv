`ifndef WATCHDOG_REG_LOAD_COUNT_SEQ_SV
`define WATCHDOG_REG_LOAD_COUNT_SEQ_SV
	
	class watchdog_reg_load_count_seq extends watchdog_base_element_sequence;
		rand bit [31:0] load_val;
		rand int intval;
		rand int delay;
		constraint load_cstr{
			soft load_val inside {['h0:'hFF]};
			soft intval inside {[3:4]};
			soft delay inside {[3:243],[258:300]};
		}
		`uvm_object_utils(watchdog_reg_load_count_seq)
		function new(string name="watchdog_reg_load_count_seq");
			super.new(name);
		endfunction
		virtual task body();
			super.body();
			`uvm_info("body", "body entered...", UVM_LOW)
		    rgm.WDOGLOAD.mirror(status);
        cfg.vif.wait_apb(1);
        rgm.WDOGLOAD.write(status, load_val);	
			`uvm_info("body", "body exiting...", UVM_LOW)
		endtask
	endclass

`endif // watchdog_reg_load_count_seq
