`ifndef WATCHDOG_SCOREBOARD_SV
`define WATCHDOG_SCOREBOARD_SV

	class watchdog_scoreboard extends watchdog_subscriber;
		bit [31:0] cur_load;
		bit [31:0] cur_count = 1000;
		int disable_do_check_countdown = 0;
    int suspend_do_check_countdown = 0;
    int num_release_inter = 0;
		int clk_num_reset_up = 0;
    int do_check_s = 0;


    uvm_event disable_count_thread_e;
    uvm_event start_check_countdown_e;
    uvm_event finish_check_countdown_e;
    int disable_count_thread = 0;


    uvm_event do_check_countdown_e;
		`uvm_component_utils(watchdog_scoreboard)
		function new(string name="watchdog_scoreboard", uvm_component parent);
			super.new(name, parent);
		endfunction
			
		function void build_phase(uvm_phase phase);
			super.build_phase(phase);
      do_check_countdown_e = _ep.get("do_check_countdown_e");


      disable_count_thread_e = _ep.get("disable_count_thread_e");
      start_check_countdown_e = _ep.get("start_check_countdown_e");
      finish_check_countdown_e = _ep.get("finish_check_countdown_e");


		endfunction
			
		task run_phase(uvm_phase phase);
			super.run_phase(phase);
				wdog_check_countdown_manger();		
      endtask	

    task listening_events();
			fork
				forever begin
					wdg_inter_e.wait_trigger();
          finish_check_countdown_e.trigger();
          start_check_countdown_e.trigger();
					//do_check_countdown_e.trigger();
          num_release_inter =0;
        end
        forever begin
					wdg_inter_disable_e.wait_trigger();
          finish_check_countdown_e.trigger();
        end
				forever begin
					wdg_resen_e.wait_trigger();
          do_check_s = 1;
        end
        forever begin
					wdg_reset_disable_e.wait_trigger();
          do_check_s = 0;
        end

        forever begin 
					wdg_intrclear_e.wait_trigger();
          num_release_inter = 0;
          disable_count_thread_e.trigger();
        end
        forever begin 
          uvm_object tmp;
          event_trans t;
					wdg_load_e.wait_trigger_data(tmp);
          void'($cast(t,tmp));
          cur_load = t.cur_load_val;
          //`uvm_error("COUNTDOWNCHECK", $sformatf(" loadval============= %x       ",cur_load))
          //num_release_inter = 0;
          disable_count_thread_e.trigger();
        end
      join_none
		endtask

    task wdog_check_countdown_manger();      
      fork 
        forever begin
          finish_check_countdown_e.wait_trigger();
          disable wdog_check_count_thread;
        end
        forever begin
          wait(cfg.enable_scb);
          start_check_countdown_e.wait_trigger;
          begin : wdog_check_count_thread
            do_check_countdown_manger();
          end
        end
      join_none
    endtask

    task do_check_countdown_manger();
      fork 
        forever begin
          disable_count_thread_e.wait_trigger(); 
          disable do_check_countdown_thread;
        end
        forever begin
          begin : do_check_countdown_thread
            do_check_countdown();
          end
        end
      join_none
    endtask  

		task do_check_countdown();
//			do_check_countdown_e.wait_trigger();
//      fork : finish_check_countdown 
//        forever begin
//          wait(cfg.enable_scb);
//          fork : check_countdown
//            begin
            
              //num_release_inter++;
		  				@(posedge cfg.vif.wdg_clk);
		  				cur_count = cur_load;
		  				fork 
		  					do begin
		  						@(posedge cfg.vif.wdg_clk);
                  if (cfg.vif.wdgres === 1)  
                    clk_num_reset_up++;
		  					  cur_count--;
		  					end while(cur_count > 0);
		  				join
		  				repeat(3) @(negedge cfg.vif.wdg_clk);
              num_release_inter++;
              if(do_check_s == 1)begin
                do_check_reset();
              end
		  				if(cfg.vif.wdgint != 1'b1) begin
		  					cfg.scb_check_error++;
		  					`uvm_error("COUNTDOWNCHECK", "WDOGINT have not be assert!")	
		  				end
              else begin
		  				  `uvm_info("COUNTDOWNCHECK", "WDOGINT assert successfully!", UVM_LOW)
              end
		  				cfg.scb_check_count++;
              disable_count_thread_e.trigger();

//		  			end
//          join
//        end
//      join_none
		endtask
      
    task do_check_reset();
      if(num_release_inter >= 2) begin
        if ((cfg.vif.wdgres === 1) && (clk_num_reset_up < 3)) begin
          `uvm_info("FINISHCHECK","reset signal assert correctly!",UVM_LOW)
		  	  
        end
        else begin
          `uvm_error("FINISHCHECK","reset signal assert by mistake!!!")
		  	  cfg.scb_check_error++;
        end
        cfg.scb_check_count++;
        finish_check_countdown_e.trigger();
      end
    endtask
		
	endclass
		

`endif



