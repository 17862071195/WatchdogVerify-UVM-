`ifndef WATCHDOG_REG_INTER_WAIT_CLEAR_SEQ_SV
`define WATCHDOG_REG_INTER_WAIT_CLEAR_SEQ_SV
	
	class watchdog_reg_inter_wait_clear_seq extends watchdog_base_element_sequence;
    rand bit [0:0] load_val;
		rand int intval;
		rand int delay;
		constraint load_cstr{
      soft load_val inside {[1'b0:1'b1]};
			soft intval inside {[3:4]};
			soft delay inside {[3:243],[258:300]};
		}
		`uvm_object_utils(watchdog_reg_inter_wait_clear_seq)
		function new(string name="watchdog_reg_inter_wait_clear_seq");
			super.new(name);
		endfunction
		task body();
			super.body();
			`uvm_info("body", "body entered..*******************************************************.", UVM_LOW)
				forever begin
					rgm.WDOGMIS.mirror(status);
					if(rgm.WDOGMIS.INT.get())break;
					repeat(intval) @ (posedge cfg.vif.wdg_clk);
				end
				repeat(delay) @(posedge cfg.vif.wdg_clk);
        `uvm_info("DROPINTER", "trigger clear interrupt",UVM_LOW)
				rgm.WDOGINTCLR.write(status, load_val);
			`uvm_info("body", "body exiting...", UVM_LOW)
		endtask
	endclass

`endif // WATCHDOG_REG_INTER_WAIT_CLEAR_SEQ_SV
