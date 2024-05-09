class test extends uvm_test;
`uvm_component_utils(test)
 
 
  function new(string name = "TEST", uvm_component parent=null);
    super.new(name, parent);
  endfunction
 
generator gen;
env e;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  gen = generator::type_id::create("gen");
  e = env::type_id::create("e",this);
endfunction
 
virtual task run_phase(uvm_phase phase);
   phase.raise_objection(this);
  gen.start(e.agt.seqr);
   #10;
   phase.drop_objection(this);
endtask
  
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
endclass
