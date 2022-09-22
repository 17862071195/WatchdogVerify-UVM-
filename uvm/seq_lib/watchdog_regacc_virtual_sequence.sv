`ifndef WATCHDOG_REGACC_VIRTUAL_SEQUENCE_SV
`define WATCHDOG_REGACC_VIRTUAL_SEQUENCE_SV

	class watchdog_regacc_virtual_sequence extends watchdog_base_virtual_sequence;
    
    bit [31:0] cur_val;

		`uvm_object_utils(watchdog_regacc_virtual_sequence)
		function new(string name ="watchdog_regacc_virtual_sequence");
			super.new(name);			
		endfunction
		
		virtual task body();
			super.body();
      //WDOGPERIPHID read check
			rgm.WDOGPERIPHID0.read(status, rd_val);
			compare_data(rd_val, 'h24);
			rgm.WDOGPERIPHID0.read(status, rd_val);
			compare_data(rd_val, 'h24);
			rgm.WDOGPERIPHID1.read(status, rd_val);
			compare_data(rd_val, 'hB8);
			rgm.WDOGPERIPHID1.read(status, rd_val);
			compare_data(rd_val, 'hB8);
			rgm.WDOGPERIPHID2.read(status, rd_val);
			compare_data(rd_val, 'h1B);
			rgm.WDOGPERIPHID2.read(status, rd_val);
			compare_data(rd_val, 'h1B);
			rgm.WDOGPERIPHID3.read(status, rd_val);
			compare_data(rd_val, 'hB0);
			rgm.WDOGPERIPHID4.read(status, rd_val);
			compare_data(rd_val, 'h04);
			rgm.WDOGPERIPHID4.read(status, rd_val);
			compare_data(rd_val, 'h04);
			rgm.WDOGPERIPHID5.read(status, rd_val);
			compare_data(rd_val, 'h00);
			rgm.WDOGPERIPHID6.read(status, rd_val);
			compare_data(rd_val, 'h00);
			rgm.WDOGPERIPHID7.read(status, rd_val);
			compare_data(rd_val, 'h00);

      //check controling of CEO-revision
      cfg.vif.ecorevnum = 4'b0000;  
			rgm.WDOGPERIPHID3.read(status, rd_val);
			compare_data(rd_val, 'h00);
      cfg.vif.ecorevnum = 4'b1111;  
			rgm.WDOGPERIPHID3.read(status, rd_val);
			compare_data(rd_val, 'hF0);
      cfg.vif.ecorevnum = 4'b1001;  
			rgm.WDOGPERIPHID3.read(status, rd_val);
			compare_data(rd_val, 'h90);
      cfg.vif.ecorevnum = 4'b1001;  
			rgm.WDOGPERIPHID3.read(status, rd_val);
			compare_data(rd_val, 'h90);

      //WDOGPCELLID read check
			rgm.WDOGPCELLID0.read(status, rd_val);
			compare_data(rd_val, 'h0D);
			rgm.WDOGPCELLID1.read(status, rd_val);
			compare_data(rd_val, 'hF0);
			rgm.WDOGPCELLID2.read(status, rd_val);
			compare_data(rd_val, 'h05);
			rgm.WDOGPCELLID3.read(status, rd_val);
			compare_data(rd_val, 'hB1);
      rgm.WDOGPCELLID0.read(status, rd_val);
			compare_data(rd_val, 'h0D);
			rgm.WDOGPCELLID1.read(status, rd_val);
			compare_data(rd_val, 'hF0);
			rgm.WDOGPCELLID2.read(status, rd_val);
			compare_data(rd_val, 'h05);
			rgm.WDOGPCELLID3.read(status, rd_val);
			compare_data(rd_val, 'hB1);

      //WDOGVALUE function check
			`uvm_do(reg_enable_intr_seq);
      `uvm_do_with(reg_load_count_seq, {load_val == 'hFF;})
      cur_val = 'hFF;
      @(posedge cfg.vif.wdg_clk);
      repeat(255) begin
        @(posedge cfg.vif.wdg_clk);
			  compare_data(cur_val, rgm.WDOGVALUE.CURVAL.get());
        cur_val--;
      end


		endtask
	endclass

`endif  //WATCHDOG_REGACC_VIRTUAL_SEQUENCE_SV
