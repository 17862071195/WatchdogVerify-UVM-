`ifndef WATCHDOG_RESEN_VIRTUAL_SEQUENCE_SV
`define WATCHDOG_RESEN_VIRTUAL_SEQUENCE_SV

	class watchdog_resen_virtual_sequence extends watchdog_base_virtual_sequence;
    int wait_int_num = 0;
		`uvm_object_utils(watchdog_resen_virtual_sequence)
		function new(string name ="watchdog_resen_virtual_sequence");
			super.new(name);			
		endfunction
		
		virtual task body();
			super.body();
			`uvm_info("body", "body entered...", UVM_LOW)
			//Enable watchdog and its interrupt generation.
			`uvm_do(reg_enable_intr_seq);
			`uvm_do_with(reg_enable_reset_seq, {switch_val == 1'b1;});
			//Load watchdog counter.
			`uvm_do_with(reg_load_count_seq, {load_val == 'h00;})
      `uvm_do_with(reg_load_count_seq, {load_val == 'hFF;})
			//Wait interrupt and clear.
      fork
        forever begin
          `uvm_do_with(reg_wait_clear_seq, {load_val inside{[1'b0:1'b1]}; intval inside {[3:243],[258:270]};  delay inside{[3:4]};})

			    `uvm_do_with(reg_wait_clear_seq, {load_val inside{[1'b0:1'b1]}; intval inside {[3:4]};  delay inside{[3:243],[258:350]};})

        end
      join_none
			fork
				waite_inter_signal_asserted();
				waite_reset_signal_asserted();
			join 
			#10ps;
		endtask
	endclass

`endif  //WATCHDOG_RESEN_VIRTUAL_SEQUENCE_SV
