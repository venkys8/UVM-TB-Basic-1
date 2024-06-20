class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)
 
  uvm_analysis_imp #(transaction,scoreboard) recv;
 
transaction ts;
 
  function new(string name = "SCOREBOARD", uvm_component parent = null);
    super.new(name, parent);
    recv = new("recv", this);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ts = transaction::type_id::create("ts");
  endfunction
 
  virtual function void write(input transaction tm);
   ts = tm;
    `uvm_info("SCO",$sformatf("Data rcvd from Monitor a :%0d , b :%0d, c:%0d. d:%0d, sel=%0d, y:%0d",tm.a,tm.b,tm.c,tm.d,tm.sel, tm.y), UVM_NONE);
  
    if(ts.y == tm.y)
      `uvm_info("SCOREBOARD","#####TEST PASSED#####", UVM_NONE)
   else
     `uvm_info("SCOREBOARD","#####TEST FAILED#####", UVM_NONE);
   endfunction
endclass
