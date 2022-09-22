`ifndef WATCHDOG_ENV_SV
`define WATCHDOG_ENV_SV

  class watchdog_env extends uvm_env;
    
    apb_master_agent apb_mst;
	  watchdog_config wdog_cfg;
	  watchdog_virtual_sequencer virt_sqr;
	  
	  watchdog_rgm rgm;
	  watchdog_reg_adapter adapter;
	  uvm_reg_predictor #(apb_transfer) predictor;
	  watchdog_coverage cov;
	  watchdog_scoreboard scb;
    `uvm_component_utils(watchdog_env)
    
    function new(string name="watchdog_env", uvm_component parent);
	  	super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
	  	super.build_phase(phase);
	  	//Get configuration from test layer
	    if (!uvm_config_db#(watchdog_config)::get(this, "", "wdog_cfg", wdog_cfg)) begin
		  	`uvm_fatal("GETCFG", "env can't get config object form test config!")  
	    end
	    uvm_config_db#(watchdog_config)::set(this, "virt_sqr", "wdog_cfg", wdog_cfg);
	    uvm_config_db#(watchdog_config)::set(this, "cov", "wdog_cfg", wdog_cfg);
	    uvm_config_db#(watchdog_config)::set(this, "scb", "wdog_cfg", wdog_cfg);
	    uvm_config_db#(apb_config)::set(this,"apb_mst", "cfg", wdog_cfg.apb_cfg);
	    apb_mst = apb_master_agent::type_id::create("apb_mst", this);
	    virt_sqr = watchdog_virtual_sequencer::type_id::create("virt_sqr", this);
	    if(!uvm_config_db#(watchdog_rgm)::get(this, "", "rgm", rgm)) begin
	    	rgm = watchdog_rgm::type_id::create("rgm",this);
		    rgm.build();
	    end
	    uvm_config_db#(watchdog_rgm)::set(this, "*", "rgm", rgm);
	    adapter = watchdog_reg_adapter::type_id::create("adapter", this);
	    predictor = uvm_reg_predictor #(apb_transfer)::type_id::create("predictor", this);
	    
	    cov = watchdog_coverage::type_id::create("cov", this);
	    scb = watchdog_scoreboard::type_id::create("scb", this);
    endfunction
    
    function void connect_phase(uvm_phase phase);
	  	super.connect_phase(phase);
	    virt_sqr.apb_mst_sqr = apb_mst.sequencer;
	    
	    rgm.map.set_sequencer(apb_mst.sequencer, adapter);
	    apb_mst.monitor.item_collected_port.connect(predictor.bus_in);
	    predictor.map = rgm.map;
	    predictor.adapter = adapter;
      apb_mst.monitor.item_collected_port.connect(cov.apb_trans_obseved_imp);
	    apb_mst.monitor.item_collected_port.connect(scb.apb_trans_obseved_imp);
	    endfunction
  
    function void report_phase(uvm_phase phase);
	    string reports;
	    super.report_phase(phase);
	    reports = {reports, $sformatf("\n============================= \n")};
	    reports = {reports, $sformatf("CURRNET TEST SUMMARY \n")};
	    reports = {reports, $sformatf("QUESTA CHECK COUNT : %0d \n", wdog_cfg.seq_check_count)};
	    reports = {reports, $sformatf("QUESTA CHECK ERROR : %0d \n", wdog_cfg.seq_check_error)};
	    reports = {reports, $sformatf("SCOREBOARD CHECK COUNT : %0d \n", wdog_cfg.scb_check_count)};
	    reports = {reports, $sformatf("SCOREBOARD CHECK ERROR : %0d \n", wdog_cfg.scb_check_error)};
	    reports = {reports, $sformatf("============================= \n")};
	    `uvm_info("TEST SUMMARY", reports, UVM_LOW)
    endfunction
  
  endclass

`endif //WATCHDOG_eNV_sV
