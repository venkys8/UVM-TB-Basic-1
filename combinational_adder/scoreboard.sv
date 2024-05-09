class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)
 
uvm_analysis_imp #(transaction,scoreboard) rec;
 
transaction t;
 
  function new(string name = "SCOREBOARD", uvm_component parent = null);
    super.new(name, parent);
    rec = new("rec", this);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    t = transaction::type_id::create("t");
  endfunction
 
  virtual function void write(input transaction tin);
   t = tin;
    `uvm_info("SCOREBOARD",$sformatf("Data received from Monitor a: %0d , b : %0d and y : %0d",t.a,t.b,t.y), UVM_NONE);
  
    if(t.y == t.a + t.b)
      `uvm_info("SCOREBOARD","#####TEST PASSED#####", UVM_NONE)
   else
     `uvm_info("SCOREBOARD","#####TEST FAILED#####", UVM_NONE);
   endfunction
endclass
