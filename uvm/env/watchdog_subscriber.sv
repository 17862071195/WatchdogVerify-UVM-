`ifndef WATCHDOG_SUBSCRIBER_SV
`define WATCHDOG_SUBSCRIBER_SV
	
  class event_trans extends uvm_object;
    bit [31:0] cur_load_val;
  endclass

	`uvm_analysis_imp_decl(_apb)
	class watchdog_subscriber extends uvm_component;
		
		//analysis import
		uvm_analysis_imp_apb#(apb_transfer, watchdog_subscriber) apb_trans_obseved_imp;
		
		//event declare
		uvm_event wdg_regacc_fd_e;
		uvm_event wdg_regacc_bd_e;
		uvm_event wdg_regacc_e;
		uvm_event wdg_inter_e;
    uvm_event wdg_inter_disable_e;
		uvm_event wdg_resen_e;
    uvm_event wdg_reset_disable_e;
		uvm_event wdg_load_e;
		uvm_event wdg_inter_assert_e;
		uvm_event wdg_inter_release_e;
		uvm_event wdg_intrclear_e;
		uvm_event_pool _ep;
		
    event_trans loadval_trans;
    bit [31:0] load_val;
    bit [0:0] last_INTEN =1'b0;
    bit [0:0] last_RESEN =1'b0;
    bit [0:0] a;

	uvm_status_e status;

		watchdog_config cfg;
		watchdog_rgm rgm;
		virtual watchdog_if vif;
		

		`uvm_component_utils(watchdog_subscriber)
		
		function new(string name="watchdog_subscriber", uvm_component parent);
			super.new(name, parent);
		endfunction
		
		function void build_phase(uvm_phase phase);
			super.build_phase(phase);
			apb_trans_obseved_imp = new("apb_trans_obseved_imp", this);
			if (!uvm_config_db #(watchdog_config)::get(this, "", "wdog_cfg",cfg))
				`uvm_error("GETCFG", "subscriber cannot get cfg from config_db")
			rgm = cfg.rgm;
			vif = cfg.vif;	
			//create local event pool and events
			_ep = new("ep");
      wdg_regacc_fd_e = _ep.get("wdg_regacc_fd_e");	
      wdg_regacc_bd_e = _ep.get("wdg_regacc_bd_e");	
      wdg_regacc_e = _ep.get("wdg_regacc_e");	
		  wdg_inter_e = _ep.get("wdg_inter_e");
		  wdg_inter_disable_e = _ep.get("wdg_inter_disable_e");
			wdg_resen_e = _ep.get("wdg_resen_e");
      wdg_reset_disable_e = _ep.get("wdg_reset_disable_e");
			wdg_load_e  = _ep.get("wdg_load_e");
			wdg_intrclear_e = _ep.get("wdg_intrclear_e");

      loadval_trans = new();
    endfunction

	  function void end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
    endfunction

		task run_phase(uvm_phase phase);
			super.run_phase(phase);
			do_evnet_trigger();
      listening_events();
		endtask
		
		virtual function void write_apb(apb_transfer tr);
			uvm_reg r;
			r = rgm.map.get_reg_by_offset(tr.addr);
      if (r) wdg_regacc_fd_e.trigger(r);
		endfunction
		
		task do_evnet_trigger();
			uvm_object tmp;
			uvm_reg r;
      fork
		  	forever begin
		  		fork 
		  			wdg_regacc_fd_e.wait_trigger_data(tmp);
		  			wdg_regacc_bd_e.wait_trigger_data(tmp);					
		  		join_any
		  		disable fork;
		  		void'($cast(r,tmp));
		  		//ensure RGM mirror value has been update by monitor transaction 
		  		#1ps;
          wdg_regacc_e.trigger(r);
		  		if(r.get_name() == "WDOGCONTROL") begin
            a = rgm.WDOGCONTROL.INTEN.get();
            if(a != last_INTEN) begin
              last_INTEN = a;
              if(a==1) 
                wdg_inter_e.trigger();
              else 
                wdg_inter_disable_e.trigger();
            end
            a = rgm.WDOGCONTROL.RESEN.get();
            if(a != last_RESEN) begin
              last_RESEN = a;
              if(a==1) 
                wdg_resen_e.trigger();
              else 
                wdg_reset_disable_e.trigger();
            end
		  			//if(rgm.WDOGCONTROL.INTEN.get() == 0) wdg_inter_disable_e.trigger();
		  			//if(rgm.WDOGCONTROL.RESEN.get() == 0) wdg_reset_disable_e.trigger();
		  		end
		  		else if(r.get_name() == "WDOGLOAD") begin
            
            loadval_trans.cur_load_val = rgm.WDOGLOAD.LOADVAL.get();
            //a = loadval_trans.cur_load_val;
            //`uvm_info("COUNTDOWNCHECK", $sformatf(" cur_count= %x       ",a), UVM_LOW)
            if(loadval_trans.cur_load_val != 0) wdg_load_e.trigger(loadval_trans);	
		  		end
		  		else if(r.get_name() == "WDOGINTCLR") begin
			  		//if(rgm.WDOGINTCLR.INTCLR.get() == 1'b1) 
            wdg_intrclear_e.trigger();
		  		end
		  	end
      join_none
		endtask

    virtual task listening_events();
		endtask

	endclass

`endif
