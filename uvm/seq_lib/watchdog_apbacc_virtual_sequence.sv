`ifndef WATCHDOG_APBACC_VIRTUAL_SEQUENCE_SV
`define WATCHDOG_APBACC_VIRTUAL_SEQUENCE_SV

class watchdog_apbacc_virtual_sequence extends watchdog_base_virtual_sequence;
  bit [0:0] aa = 1'b1;
	`uvm_object_utils(watchdog_apbacc_virtual_sequence)
	
	function new(string name="watchdog_apbacc_virtual_sequence");
		super.new(name);
		
	endfunction
	
	virtual task body();
		super.body();
		`uvm_info("body", "Entered...", UVM_LOW)
		//TODO in sub-class
		//inline constraint with APB addrs,data 
    //read default addr  
		`uvm_do_on_with(apb_wr_seq, p_sequencer.apb_mst_sqr, {addr == 'h18; data == 'h99;})
		//compare_data(apb_rd_seq.data, 'h00);
		fork
      forever begin
        @(negedge cfg.vif.apb_clk)
        aa=~aa;
        cfg.vif.ecorevnum = ~aa;  
      end
    join_none
    `uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'h1c;})
		compare_data(apb_rd_seq.data, 'h00);
		`uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'hFCC;})
		compare_data(apb_rd_seq.data, 'hxxxxxxxx);
		`uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'hFBC;})
		`uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'hFBC;})
		compare_data(apb_rd_seq.data, 'hxxxxxxxx);

		`uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'h0FE0;})
		compare_data(apb_rd_seq.data, 'h24);
		`uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'h0FE4;})
		compare_data(apb_rd_seq.data, 'hB8);
		`uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'h0FE8;})
		compare_data(apb_rd_seq.data, 'h1B);
		`uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'h0FEC;})
		compare_data(apb_rd_seq.data, 'hB0);
		`uvm_info("body", $sformatf("seq_check_count: %d", p_sequencer.cfg.seq_check_count), UVM_LOW)
		`uvm_info("body", $sformatf("seq_check_error: %d", p_sequencer.cfg.seq_check_error), UVM_LOW)
		`uvm_info("body", "Exiting...", UVM_LOW)
		
	endtask
	
endclass

`endif
