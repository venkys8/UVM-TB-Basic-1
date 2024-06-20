class monitor extends uvm_monitor;
`uvm_component_utils(monitor)
 
uvm_analysis_port #(transaction) send;
 
  function new(string name = "MONITOR", uvm_component parent = null);
    super.new(name, parent);
    send = new("send", this);
  endfunction
 
  transaction tm;
  virtual mux_if vif;
 
  virtual function void build_phase(uvm_phase phase);
   super.build_phase(phase);
    tm = transaction::type_id::create("tm");
    
    if(!uvm_config_db #(virtual mux_if)::get(this,"","vif",vif)) 
   `uvm_error("MON","Unable to access uvm_config_db");
  endfunction
 
    virtual task run_phase(uvm_phase phase);
    forever begin
    #10;
    tm.a = vif.a;
    tm.b = vif.b;
    tm.c = vif.c;
    tm.d = vif.d;
    tm.sel = vif.sel;
    tm.y = vif.y;
       `uvm_info("MON",$sformatf("Data sent to scoreboard a :%0d , b :%0d, c:%0d. d:%0d, sel=%0d, y:%0d",tm.a,tm.b,tm.c,tm.d,tm.sel, tm.y), UVM_NONE);
      send.write(tm);
    end
    endtask
endclass
