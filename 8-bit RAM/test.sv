class test extends uvm_test;
  `uvm_component_utils(test)
  
  generator gen;
  env e;
  
  function new(string name="TEST", uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e=env::type_id::create("e",this);
    gen=generator::type_id::create("gen",this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    gen.start(e.agt.seqr);
    #20;//manual delay to collect resp of last stimuli to DUT
    phase.drop_objection(this);
  endtask
endclass
