`ifndef WATCHDOG_CONFIG_SV
`define WATCHDOG_CONFIG_SV

class watchdog_config extends uvm_object;

	int seq_check_count;
	int seq_check_error;
	
	int scb_check_count;
	int scb_check_error;
	
	bit enable_cov = 1;
  bit enable_cov_inter_sgnl = 1;
  bit enable_cov_rest_sgnl = 1;
	bit enable_scb = 1;
  bit enable_scb_loadcounter_check = 0;	
	
  apb_config apb_cfg;
	virtual watchdog_if vif;
	watchdog_rgm rgm;	
	
	`uvm_object_utils(watchdog_config)
	function new(string name="watchdog_config");
		super.new(name);
		apb_cfg = apb_config::type_id::create("apb_cfg");
	endfunction

endclass

`endif // WATCHDOG_CONFIG_SV







//`ifndef WATCHDOG_CONFIG_SV
//`define WATCHDOG_CONFIG_SV
//
//class watchdog_config extends uvm_object;
//	
//	apb_config apb_cfg;
//	
//	`uvm_object_utils(watchdog_config)
//	
//	function new(string name="watchdog_config");
//		super.new(name);
//	endfunction
//endclass
//
//`endif //WATCHDOG_CONFIG_SV


