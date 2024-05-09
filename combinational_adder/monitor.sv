class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  uvm_analysis_port#(transaction) send;
  
  function new(string name="MON",uvm_component parent=null);
    super.new(name,parent);
    send=new("send",this);
  endfunction
  
  transaction t;
  virtual add_if vif;
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    t=transaction::type_id::create("t");
    
    if(!uvm_config_db#(virtual add_if)::get(this,"","vif",vif))
      `uvm_error("MONITOR","Unable to get interface in monitor");
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      #10;
      t.a=vif.a;
      t.b=vif.b;
      t.y=vif.y;
      `uvm_info("MONITOR",$psprintf("Data sent to scoreboard. a=%0d, b=%0d, y=%0d",t.a,t.b,t.y),UVM_LOW)
      send.write(t);
    end
  endtask    
endclass
  
  
