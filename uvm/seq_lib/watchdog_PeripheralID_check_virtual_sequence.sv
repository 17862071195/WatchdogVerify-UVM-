`ifndef WATCHDOG_PERIPHERALID_CHECK_VIRTUAL_SEQUENCE_SV
`define WATCHDOG_PERIPHERALID_CHECK_VIRTUAL_SEQUENCE_SV

  class watchdog_PeripheralID_check_virtual_sequence extends watchdog_base_virtual_sequence();
    `uvm_object_utils(watchdog_PeripheralID_check_virtual_sequence)
    function new(string name="watchdog_PeripheralID_check_virtual_sequence");
      super.new(name);
    endfunction

    virtual task body();
      super.body();
      //check PeripheralID
      rgm.WDOGPERIPHID0.read(status, rd_val);
      `uvm_info("CHCKID", $sformatf("WDOGPERIPHID0 is 'h%0x", rd_val), UVM_LOW);
      rgm.WDOGPERIPHID1.read(status, rd_val);
      `uvm_info("CHCKID", $sformatf("WDOGPERIPHID1 is 'h%0x", rd_val), UVM_LOW);
      rgm.WDOGPERIPHID2.read(status, rd_val);
      `uvm_info("CHCKID", $sformatf("WDOGPERIPHID2 is 'h%0x", rd_val), UVM_LOW);
      rgm.WDOGPERIPHID3.read(status, rd_val);
      `uvm_info("CHCKID", $sformatf("WDOGPERIPHID3 is 'h%0x", rd_val), UVM_LOW);
      rgm.WDOGPERIPHID4.read(status, rd_val);
      `uvm_info("CHCKID", $sformatf("WDOGPERIPHID4 is 'h%0x", rd_val), UVM_LOW);
      rgm.WDOGPERIPHID5.read(status, rd_val);
      `uvm_info("CHCKID", $sformatf("WDOGPERIPHID5 is 'h%0x", rd_val), UVM_LOW);
      rgm.WDOGPERIPHID6.read(status, rd_val);
      `uvm_info("CHCKID", $sformatf("WDOGPERIPHID6 is 'h%0x", rd_val), UVM_LOW);
      rgm.WDOGPERIPHID7.read(status, rd_val);
      `uvm_info("CHCKID", $sformatf("WDOGPERIPHID7 is 'h%0x", rd_val), UVM_LOW);
    endtask

  endclass

`endif // WATCHDOG_PERIPHERALID_CHECK_VIRTUAL_SEQUENCE_SV

