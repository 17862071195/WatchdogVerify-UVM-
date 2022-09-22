`ifndef WATCHDOG_COVERAGE_SV
`define WATCHDOG_COVERAGE_SV

class watchdog_coverage extends watchdog_subscriber;
  bit [31:0] reg_field_val;
  event wdg_regacc_sve;
  `uvm_component_utils(watchdog_coverage)
  //covergroup definition below
  //T1 overall control
  //T1.1 interrupt enable and disable(0->1 , 1->0)
  //T1.2 reset enable and disable (0->1 , 1->0)
  covergroup wdg_t1_overall_control_cg with function sample(bit [31:0] val);
    option.name = "T1 watchdog overall control";
    INTEN : coverpoint val[0] {
      bins stat_en    = {1'b0};
      bins stat_dis   = {1'b1};
      bins to_enable  = (1'b0 => 1'b1);
      bins to_disable = (1'b1 => 1'b0);
    }
    RESEN : coverpoint val[1] {
      bins stat_en    = {1'b0};
      bins stat_dis   = {1'b1};
      bins to_enable  = (1'b0 => 1'b1);
      bins to_disable = (1'b1 => 1'b0);
    }
  endgroup

  covergroup wdg_t1_overall_control_clk_cg (ref bit [31:0] val) @(wdg_regacc_sve);
    option.name = "T1 Watchdog overall control";
    INTEN : coverpoint val[0] {
      bins sata_en    = {1'b1};
      bins sata_dis   = {1'b0};
      bins to_enable  = (1'b0 => 1'b1);
      bins to_disable = (1'b1 => 1'b0);
    }
    RESEN : coverpoint val[1] {
      bins stat_en    = {1'b1};
      bins stat_dis   = {1'b0};
      bins to_enable  = (1'b0 => 1'b1);
      bins to_disable = (1'b1 => 1'b0);
    }
  endgroup



  //T2 Watchdog load and reload 
  //T2.1 Intinial load (coutn 0 -> load val)
  //T2.2 Relaod val (laod val 1 -> laod val 2)
  //T2.3 Load val range (min & max & otehers)
  covergroup wdg_t2_load_reload_cg with function sample(bit [31:0] val);
    option.name = "wdg T2 load & reload";
    INITLOAD : coverpoint val{
      bins initload = (0 => [1:32'hFF]);
    } 
    RELOAD : coverpoint val{
      bins reload = ([1:32'hFF] => [1:32'hFF]); 
    }
    LOADRANGE : coverpoint val{
      bins min = {32'h1};
      bins max = {32'hFF};
      bins others = {[32'h2 : 32'hFE]};
    }
  endgroup


  //T3 wdog interrupt signal trigger and release  
  covergroup wdg_t3_inter_trigger_release_cg with function sample(bit [31:0] val);
    option.name = "wdg T3 trigger & release";
    INTSGL : coverpoint val {
      bins state_rels = {1'b0};
      bins state_trig = {1'b1};
      bins to_trig    = (1'b0 => 1'b1);
      bins to_relea   = (1'b1 => 1'b0); 
    }
  endgroup

  //T4 reset signal trigger and release
  covergroup wdg_t4_rest_trigger_release_cg with function sample(bit [0:0] val) ;
    option.name = "wdg T4 trigger & release";
    RESSGNL : coverpoint val {
      bins stat_rels = {1'b0};
      bins stat_trig = {1'b0};
      bins to_trig   = (1'b0 => 1'b1);
      //bins to_rels   = (1'b1 => 1'b0);
    }
  endgroup
  
  //T5 watchdog ECO revision control
//  covergroup wdg_t5_revision_control with function sample(bit [3:0] val);
//    REVSGNL coverpoint val {
//      bins min = {4'b0000};
//      bins max = {4'b1111};
//      others
//    }
//  endgroup

	function new(string name="watchdog_coverage", uvm_component parent);
		super.new(name, parent);
    wdg_t1_overall_control_cg = new();
    wdg_t2_load_reload_cg = new();
    wdg_t1_overall_control_clk_cg = new(this.reg_field_val);
    wdg_t3_inter_trigger_release_cg =new();
    wdg_t4_rest_trigger_release_cg   = new();
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
      //cg_int = new(cfg.vif.wdgint);
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    if (cfg.enable_cov_inter_sgnl) begin 
      fork 
        forever begin
          wait(cfg.enable_cov);    
          @(posedge vif.wdg_clk);
          wdg_t3_inter_trigger_release_cg.sample(vif.wdgint);
        end
      join_none
    end 
    if (cfg.enable_cov_rest_sgnl) begin 
      fork 
        forever begin
          wait(cfg.enable_cov);    
          @(posedge vif.wdg_clk);
          wdg_t4_rest_trigger_release_cg.sample(vif.wdgres);
          rgm.WDOGVALUE.mirror(status);
        end
      join_none
    end 

  endtask 

  task listening_events();
    uvm_object tmp;
    uvm_reg r;
    fork 
      forever begin
        wait(cfg.enable_cov);
        wdg_regacc_e.wait_trigger_data(tmp);
        void'($cast(r,tmp));
        if (r.get_name() == "WDOGCONTROL") begin
          wdg_t1_overall_control_cg.sample(rgm.WDOGCONTROL.get());
          reg_field_val = rgm.WDOGCONTROL.get();
          -> wdg_regacc_sve;
        end
        if (r.get_name() == "WDOGLOAD") begin
          wdg_t2_load_reload_cg.sample(rgm.WDOGLOAD.LOADVAL.get());
        end
        else begin
          reg_field_val  = 0;
        end
      end  
    join_none
  endtask
	
endclass
		

`endif
