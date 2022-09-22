`ifndef WATCHDOG_INTEGRATION_VIRTUAL_SEQUENCE_SV
`define WATCHDOG_INTEGRATION_VIRTUAL_SEQUENCE_SV

class watchdog_integration_virtual_sequence extends watchdog_base_virtual_sequence;
	`uvm_object_utils(watchdog_integration_virtual_sequence)
	
	function new(string name="watchdog_integration_virtual_sequence");
		super.new(name);
	endfunction
	
	task body();
		super.body();
		//check WDOGINT and WDOGRES reset value
		`uvm_info("INTGTEST", "Check WDOGINT & WDOGRES reset value", UVM_LOW)
		compare_data(cfg.vif.wdgres, 1'b0);
		compare_data(cfg.vif.wdgint, 1'b0);
		
		//enable integration test mode
		rgm.WDOGITCR.ITME.set(1'b1);
		rgm.WDOGITCR.update(status);
		
		//check WDOGINT and WDOGRES control value, in integration mode
		`uvm_info("INTGTEST", "Check WDOGINT & WDOGRES test control value", UVM_LOW)
		rgm.WDOGITOP.WDOGINT.set(1'b1);
		rgm.WDOGITOP.WDOGRES.set(1'b1);
		rgm.WDOGITOP.update(status);
		compare_data(cfg.vif.wdgres, 1'b1);
		compare_data(cfg.vif.wdgint, 1'b1);
		
		rgm.WDOGITOP.WDOGINT.set(1'b0);
		rgm.WDOGITOP.WDOGRES.set(1'b0);
		rgm.WDOGITOP.update(status);
		compare_data(cfg.vif.wdgres, 1'b0);
		compare_data(cfg.vif.wdgint, 1'b0);
		
		//check integration mode exit
		`uvm_info("INTGTEST", "Check integration test mode exit", UVM_LOW)
    rgm.WDOGITOP.WDOGINT.set(1'b1);
    rgm.WDOGITOP.WDOGRES.set(1'b1);
    rgm.WDOGITOP.update(status);
    compare_data(cfg.vif.wdgint, 1'b1);
    compare_data(cfg.vif.wdgres, 1'b1);

    rgm.WDOGITCR.ITME.set(1'b0);
    rgm.WDOGITCR.update(status);
    compare_data(cfg.vif.wdgint, 1'b0);
    compare_data(cfg.vif.wdgres, 1'b0);
		
		//check WDOGINT and WDOGRES
		
		`uvm_info("SEQSTART", "virtual sequence body started!! ", UVM_LOW)
		
		`uvm_info("SEQSTART", "virtual sequence body started!! ", UVM_LOW)
	endtask
endclass:watchdog_integration_virtual_sequence

`endif  