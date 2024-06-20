class driver extends uvm_driver #(transaction);
`uvm_component_utils(driver)
 
  function new(string name = "DRIVER", uvm_component parent = null);
    super.new(name, parent);
  endfunction
 
	transaction td;
	virtual mux_if vif;
 
 
    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      td = transaction::type_id::create("dt");
 
      if(!uvm_config_db #(virtual mux_if)::get(this,"","vif",vif)) 
        `uvm_error("DRIVER","Unable to access uvm_config_db");
    endfunction
 
    virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(td);
    vif.a <= td.a;
    vif.b <= td.b;
    vif.c <= td.c;
    vif.d <= td.d;
    vif.sel <= td.sel;
      `uvm_info("DRV",$sformatf("Data send to DUT a :%0d , b :%0d, c:%0d. d:%0d, sel=%0d",td.a,td.b,td.c,td.d,td.sel), UVM_NONE);
    seq_item_port.item_done();
    #10;  
    end
    endtask
endclass
