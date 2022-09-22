`ifndef WATCHDOG_BASE_TEST_SV
`define WATCHDOG_BASE_TEST_SV


	
virtual class watchdog_base_test extends uvm_test;

	watchdog_config wdog_cfg;
	watchdog_env env;
	watchdog_rgm rgm;
	
	//`uvm_component_utils(watchdog_base_test);
	
 	function new (string name = "watchdog_base_test", uvm_component parent);
    super.new(name, parent);
 	endfunction
 	
 	function void build_phase(uvm_phase phase);
	 	super.build_phase(phase);
	 	rgm = watchdog_rgm::type_id::create("rgm");
	 	rgm.build();
	 	uvm_config_db#(watchdog_rgm)::set(this, "env", "rgm", rgm);
	 	
	 	wdog_cfg = watchdog_config::type_id::create("watchdog_config");
	 	wdog_cfg.rgm = rgm;
	 	if(!uvm_config_db#(virtual watchdog_if)::get(this, "", "vif", wdog_cfg.vif))
		 	`uvm_error("GETVIF", "con't get virtual intrface from top tb")
		uvm_config_db#(watchdog_config)::set(this, "env", "wdog_cfg", wdog_cfg);
	 	env = watchdog_env::type_id::create("env", this);
 	endfunction
 	
 	function void connect_phase(uvm_phase phase);
	 	super.connect_phase(phase);
	 	
 	endfunction
 	
 	task run_phase(uvm_phase phase);
		super.run_phase(phase);
	 	phase.phase_done.set_drain_time(this, 300ns);
	 	phase.raise_objection(this);
	 	do_init_clks();
	 	do_init_regs();
		phase.drop_objection(this);
 	endtask
 	
 	virtual task do_init_clks();
	 	//TODO in sub class;
 	endtask
 	
 	virtual task do_init_regs();
	 	repeat(10) @(posedge wdog_cfg.vif.apb_clk);
	 	//TODO in sub class;
 	endtask

endclass:watchdog_base_test

`endif  //WATCHDOG_BASE_TEST_SV
