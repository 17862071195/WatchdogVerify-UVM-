`ifndef WATCHDOG_DISABLE_INTER_TEST_SV
`define WATCHDOG_DISABLE_INTER_TEST_SV
	
	class watchdog_disable_inter_test extends watchdog_base_test;
		`uvm_component_utils(watchdog_disable_inter_test)
		function new(string name="watchdog_disable_inter_test", uvm_component parent);
			super.new(name, parent);
		endfunction
		
		function void build_phase(uvm_phase phase);
			super.build_phase(phase);
      wdog_cfg.enable_scb = 0;
		endfunction
	  task run_phase(uvm_phase phase);   
			watchdog_disable_inter_virtual_sequence seq = watchdog_disable_inter_virtual_sequence::type_id::create("this");
			super.run_phase(phase);
			phase.raise_objection(this); 
			seq.start(env.virt_sqr);
			phase.drop_objection(this);
		endtask
	endclass

`endif  //WATCHDOG_DISABLE_INTER_TEST_SV
