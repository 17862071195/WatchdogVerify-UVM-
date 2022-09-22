`ifndef WATCHDOG_INTEGRATION_TEST_SV
`define WATCHDOG_INTEGRATION_TEST_SV

class watchdog_integration_test extends watchdog_base_test;
	`uvm_component_utils(watchdog_integration_test)
	
	function new(string name="watchdog_integration_test", uvm_component parent);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		watchdog_integration_virtual_sequence seq = watchdog_integration_virtual_sequence::type_id::create("seq");
		super.run_phase(phase);
		phase.raise_objection(this); 
		//TODO attach virtual sequence on cirtual sequencer
		seq.start(env.virt_sqr);
		phase.drop_objection(this);
	endtask
	 

endclass

`endif  //WATCHDOG_INTEGRATION_TEST_SV