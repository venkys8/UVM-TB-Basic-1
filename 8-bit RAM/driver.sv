class driver extends uvm_driver#(transaction);
  `uvm_component_utils(driver)
  
  transaction t;
  virtual mem_intf vif;
  
  function new(string name="DRIVER",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    t=transaction::type_id::create("t");
    
    if(!uvm_config_db#(virtual mem_intf)::get(this,"","vif",vif))
      `uvm_error("DRIVER","Unable to access interface from Driver");
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(t);
      vif.wr	<= t.wr;
      vif.din	<= t.din;
      vif.addr	<= t.addr;
      `uvm_info("DRIVER",$psprintf("DRIVER->DUT, wr=%0d, addr=%0d, din=%0d, dout=%0d", t.wr, t.addr, t.din, t.dout),UVM_LOW)
      seq_item_port.item_done();
      @(posedge vif.clk);// for mem, we have latency of 2 clocks. if we are performing write operation,
      //we are waiting for 1 clk
      
      if(t.wr == 1'b0)
        @(posedge vif.clk);//for reading, we are waiting 1 more clock.
    end
  endtask
endclass
