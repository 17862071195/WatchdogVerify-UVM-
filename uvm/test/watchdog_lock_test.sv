`ifndef WATCHDOG_LOCK_TEST_SV
`define WATCHDOG_LOCK_TEST_SV

	class watchdog_lock_test extends watchdog_base_test;
		`uvm_component_utils(watchdog_lock_test)
		function new(string name="watchdog_lock_test", uvm_component parent);
			super.new(name, parent);
		endfunction
		
		function void build_phase (uvm_phase phase);
			super.build_phase(phase);
      wdog_cfg.enable_scb = 0;
		endfunction
		
		task run_phase(uvm_phase phase);
			watchdog_lock_virtual_sequcence seq = watchdog_lock_virtual_sequcence::type_id::create("seq");
      super.run_phase(phase);
		  phase.raise_objection(this);	
			seq.start(env.virt_sqr);
		  phase.drop_objection(this);	
		endtask
	endclass
`endif
