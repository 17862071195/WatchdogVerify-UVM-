`ifndef WATCHDOG_PERIPHERALID_CHECK_TEST_SV
`define WATCHDOG_PERIPHERALID_CHECK_TEST_SV

 class watchdog_PeripheralID_check_test extends watchdog_base_test;
   `uvm_component_utils(watchdog_PeripheralID_check_test)
   
   function new(string name="watchdog_PeripheralID_check_test", uvm_component parent);
     super.new(name, parent);     
   endfunction

   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     wdog_cfg.enable_cov_inter_sgnl = 1;  
     wdog_cfg.enable_cov_rest_sgnl = 1;  
   endfunction

   task run_phase(uvm_phase phase);
     watchdog_PeripheralID_check_virtual_sequence seq = watchdog_PeripheralID_check_virtual_sequence::type_id::create("seq");  
     super.run_phase(phase);
     phase.raise_objection(this);
     seq.start(env.virt_sqr);
     phase.drop_objection(this);
   endtask
 endclass

`endif
