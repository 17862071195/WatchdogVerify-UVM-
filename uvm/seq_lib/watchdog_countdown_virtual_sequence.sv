`ifndef WATCHDOG_COUNTDOWN_VIRTUAL_SEQUENCE_SV
`define WATCHDOG_COUNTDOWN_VIRTUAL_SEQUENCE_SV
	
	class watchdog_countdown_virtual_sequence extends watchdog_base_virtual_sequence;
		`uvm_object_utils(watchdog_countdown_virtual_sequence)
		function new(string name="watchdog_countdown_virtual_sequence");
			super.new(name);
		endfunction
		task body();
			super.body();
			`uvm_info("body", "body entered...", UVM_LOW)
			//Enable watchdog and its interrupt generation.
			`uvm_do(reg_enable_intr_seq);
			`uvm_do_with(reg_enable_reset_seq, {switch_val == 1'b1;});
			//Load watchdog counter.
      `uvm_do_with(reg_load_count_seq, {load_val == 'hFF;})
			//Wait interrupt and clear.
      fork
        forever begin
          `uvm_do_with(reg_wait_clear_seq, {intval inside {[3:243],[258:300]};  delay inside{[3:4]};})
			    `uvm_do_with(reg_wait_clear_seq, {intval inside {[3:4]};  delay inside{[3:243],[258:300]};})
        end
      join_none
			fork
				waite_inter_signal_asserted();
				waite_reset_signal_asserted();
			join 
			#10us;
			
			
//			rgm.WDOGCONTROL.INTEN.set(1'b1);
//			rgm.WDOGCONTROL.update(status);
//			rgm.WDOGLOAD.write(status, 'hFF);
//			repeat(10) begin 
//				rgm.WDOGLOAD.read(status, rd_val);	
//				`uvm_info("REGREAD", $sformatf("WDOGLOAD value is: %0x", rd_val), UVM_LOW)
//				rgm.WDOGVALUE.read(status, rd_val);
//				`uvm_info("REGREAD", $sformatf("WDOGVALUE value is: %0x", rd_val), UVM_LOW)
//			end
//			#100us;
			`uvm_info("body", "body exiting...", UVM_LOW)
		endtask
	endclass

`endif // WATCHDOG_COUNTDOWN_VIRTUAL_SEQUENCE_SV
