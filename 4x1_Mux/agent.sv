class agent extends uvm_agent;
`uvm_component_utils(agent)
 
  function new(string name = "AGENT", uvm_component parent=null);
    super.new(name, parent);
  endfunction
 
monitor mon;
driver drv;
uvm_sequencer #(transaction) seqr;
 
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  mon = monitor::type_id::create("mon",this);
  drv = driver::type_id::create("drv",this);
  seqr = uvm_sequencer #(transaction)::type_id::create("seqr",this);
endfunction
 
 
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
  drv.seq_item_port.connect(seqr.seq_item_export);
endfunction
endclass
