`ifndef WATCHDOG_LOCK_VIRTUAL_SEQUENCE
`define WATCHDOG_LOCK_VIRTUAL_SEQUENCE

	class watchdog_lock_virtual_sequcence extends watchdog_base_virtual_sequence;
		`uvm_object_utils(watchdog_lock_virtual_sequcence)
    
    bit [31:0] wdg_lock_val = 32'hF;
		
    function new(string name="watchdog_lock_virtual_sequcence");
			super.new(name);
		endfunction
		
		task body ();
			super.body();
			//Normal access to REG by default (unclock)
			check_wdog_unlock_control_status();
			//set lock status
			rgm.WDOGLOCK.write(status, 1'b1 <<1 );
			rgm.WDOGLOCK.mirror(status);
			compare_data(rgm.WDOGLOCK.WRACC.get(), 1'b1);
			//check WDOGCONTROL.INTEN with locked status
			check_wdog_lock_control_status();
			
			//set unlock status
			rgm.WDOGLOCK.write(status, 'h1ACCE551);
			rgm.WDOGLOCK.mirror(status);
			compare_data(rgm.WDOGLOCK.WRACC.get(), 1'b0);
			//check WDOGCONTROL.INTEN with locked status
			check_wdog_unlock_control_status();

      do begin
        if (wdg_lock_val != 'h1ACCE551) begin
         	//set lock
          rgm.WDOGLOCK.write(status, wdg_lock_val);
          rgm.WDOGLOCK.mirror(status);
		      compare_data(rgm.WDOGLOCK.WRACC.get(), 1'b1);
		      //check wdg with lock
          check_wdog_lock_control_status();
		    	
          //set unlock status
		    	rgm.WDOGLOCK.write(status, 'h1ACCE551);
		    	rgm.WDOGLOCK.mirror(status);
		    	compare_data(rgm.WDOGLOCK.WRACC.get(), 1'b0);
		    	//check WDOGCONTROL.INTEN with locked status
		    	check_wdog_unlock_control_status();        
          rgm.WDOGLOCK.write(status, wdg_lock_val);
          wdg_lock_val --;
        end
      end  while(wdg_lock_val != 32'h0);

      wdg_lock_val = 32'h1FFFFFFF;

      do begin
        if (wdg_lock_val != 'h1ACCE551) begin
         	//set lock
          rgm.WDOGLOCK.write(status, wdg_lock_val);
          rgm.WDOGLOCK.mirror(status);
		      compare_data(rgm.WDOGLOCK.WRACC.get(), 1'b1);
		      //check wdg with lock
          check_wdog_lock_control_status();
		    	
          //set unlock status
		    	rgm.WDOGLOCK.write(status, 'h1ACCE551);
		    	rgm.WDOGLOCK.mirror(status);
		    	compare_data(rgm.WDOGLOCK.WRACC.get(), 1'b0);
		    	//check WDOGCONTROL.INTEN with locked status
		    	check_wdog_unlock_control_status();        
          rgm.WDOGLOCK.write(status, wdg_lock_val);
          wdg_lock_val --;
        end
      end  while(wdg_lock_val != 32'h1FFFFFF0);

		endtask
		
		task check_wdog_unlock_control_status();
			rgm.WDOGCONTROL.INTEN.set( 1'b1);
			rgm.WDOGCONTROL.update(	status);
			rgm.WDOGCONTROL.mirror(status);
			compare_data(rgm.WDOGCONTROL.INTEN.get(), 1'b1);
			
			rgm.WDOGCONTROL.INTEN.set(1'b0);
			rgm.WDOGCONTROL.update(status);
			rgm.WDOGCONTROL.mirror(status);
			compare_data(rgm.WDOGCONTROL.INTEN.get(), 1'b0);
		endtask
		
		task check_wdog_lock_control_status();
			rgm.WDOGCONTROL.INTEN.set(1'b1);
			rgm.WDOGCONTROL.update(	status);
			rgm.WDOGCONTROL.mirror(status);
			compare_data(rgm.WDOGCONTROL.INTEN.get(), 1'b0);
			
			rgm.WDOGCONTROL.INTEN.set(1'b0);
			rgm.WDOGCONTROL.update(status);
			rgm.WDOGCONTROL.mirror(status);
			compare_data(rgm.WDOGCONTROL.INTEN.get(), 1'b0);
				endtask
				
	endclass

`endif
