interface watchdog_if;

	//logic wdg_clk_en;
	logic [3:0] ecorevnum = 4'b1011; 
	logic wdgint;
	logic wdgres;
	
	logic apb_clk;
	logic apb_rstn;
	logic wdg_clk;
	logic wdg_rstn;

  task wait_apb(int n);
    repeat(n) @(posedge apb_clk);
  endtask

  task wait_wdg(int n);
    repeat(n) @(posedge wdg_clk);
  endtask 

endinterface
