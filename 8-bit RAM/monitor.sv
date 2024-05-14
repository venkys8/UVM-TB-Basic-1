class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  virtual mem_intf vif;
  transaction t;
  uvm_analysis_port#(transaction) send_port;
  
  function new(string name="MONITOR", uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    t=transaction::type_id::create("t");
    send_port=new("SEND_PORT",this);
    
    if(!uvm_config_db#(virtual mem_intf)::get(this,"","vif",vif))
      `uvm_error("MONITOR","Unable to access interface in Monitor");
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      t.wr = vif.wr;
      t.addr = vif.addr;
      t.din = vif.din;
      
      if(vif.wr == 1'b0) begin
        @(posedge vif.clk)
        t.dout = vif.dout;
      end
      
      `uvm_info("MONITOR",$psprintf("DUT->MONITOR, wr=%0d, addr=%0d, din=%0d, dout=%0d",t.wr, t.addr, t.din, t.dout),UVM_LOW)
      send_port.write(t);
    end
  endtask
endclass
