class env extends uvm_env;
  `uvm_component_utils(env)
  
  function new(string name="ENV", uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  scoreboard sbd;
  agent agt;
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt=agent::type_id::create("agt",this);
    sbd=scoreboard::type_id::create("sbd",this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon.send_port.connect(sbd.rec_port);
  endfunction
endclass
