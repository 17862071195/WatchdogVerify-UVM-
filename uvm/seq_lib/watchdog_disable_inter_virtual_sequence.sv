`ifndef WATCHDOG_DISABLE_INTER_VIRTUAL_SEQUENCE_SV
`define WATCHDOG_DISABLE_INTER_VIRTUAL_SEQUENCE_SV
	
	class watchdog_disable_inter_virtual_sequence extends watchdog_base_virtual_sequence;
		`uvm_object_utils(watchdog_disable_inter_virtual_sequence)
		function new(string name="watchdog_disable_inter_virtual_sequence");
			super.new(name);
		endfunction
		virtual task body();
			super.body();
			`uvm_info("body", "body entered...", UVM_LOW)
			//Enable watchdog and its interrupt generation.
			`uvm_do(reg_enable_intr_seq);
			  `uvm_do_with(reg_enable_reset_seq, {switch_val == 1'b1;});
			//Load watchdog counter.
			`uvm_do_with(reg_load_count_seq, {load_val == 'hFF;})
			//Wait interrupt and disable interrupt.
			waite_inter_signal_asserted();
			waite_reset_signal_asserted();
			check_inter_ris_mis(1'b1, 1'b1);
			repeat(20) @(posedge cfg.vif.wdg_clk);
			fork
				`uvm_do(reg_disable_intr_seq);    
			  `uvm_do_with(reg_enable_reset_seq, {switch_val == 1'b0;});
				waite_inter_signal_released();
			join
			check_inter_ris_mis(1'b1, 1'b0);
			#1us;  
			
			//check inte=1, ris=1, mis=1, after eanble inter 
			`uvm_do(reg_enable_intr_seq)
			  `uvm_do_with(reg_enable_reset_seq, {switch_val == 1'b1;});
			compare_data(cfg.vif.wdgint,1'b1);
			check_inter_ris_mis(1'b1, 1'b1);
			`uvm_info("body", "body exiting...", UVM_LOW)
		endtask
		
		//ris : raw interrupt status
		//mis :     interrupt status
		task check_inter_ris_mis(input bit ris, input bit mis);
			rgm.WDOGRIS.mirror(status);
			compare_data(ris, rgm.WDOGRIS.get());
			rgm.WDOGMIS.mirror(status);
			compare_data(mis, rgm.WDOGMIS.get());
		endtask
	endclass

`endif // WATCHDOG_DISABLE_INTER_VIRTUAL_SEQUENCE_SV
