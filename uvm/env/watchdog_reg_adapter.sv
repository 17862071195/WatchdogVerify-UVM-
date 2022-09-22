`ifndef WATCHDOG_REG_ADAPTER_SV
`define WATCHDOG_REG_ADAPTER_SV

	class watchdog_reg_adapter extends uvm_reg_adapter;
		`uvm_object_utils(watchdog_reg_adapter)
		function new(string name="watchdog_reg_adapter");
			super.new(name);
			provides_responses = 1;
		endfunction
		
		function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
			apb_transfer t = apb_transfer::type_id::create("t");
			t.trans_kind = (rw.kind == UVM_WRITE) ? WRITE : READ; 
			t.addr = rw.addr;
			t.data = rw.data;
			t.idle_cycles = 1;
			return t;			
		endfunction
		
		function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
			apb_transfer t;
			if(!$cast(t, bus_item)) begin
				`uvm_fatal("CASTFAIL", "provide buse_item is not correct type!")
				return;
			end
			rw.kind = (t.trans_kind == WRITE) ? UVM_WRITE : UVM_READ; 
			rw.addr = t.addr;
			rw.data = t.data;
			rw.status =  UVM_IS_OK;		
		endfunction
	endclass

`endif  //WATCHDOG_REG_ADAPTER_SV
