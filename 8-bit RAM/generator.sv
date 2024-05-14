//we name our sequence as generator
class generator extends uvm_sequence#(transaction);
  `uvm_object_utils(generator)
  
  transaction t;
  
  function new(string name="GEN");
    super.new(name);
  endfunction
  
  virtual task body();
    for(int i=0;i<10;i++) begin
      t=transaction::type_id::create("t");
      t.randomize();
      start_item(t);
      $display("------------------------------");
      `uvm_info("GENERATOR",$psprintf("SEQ->DRIVER, wr=%0d, addr=%0d, din=%0d, dout=%0d", t.wr, t.addr, t.din, t.dout), UVM_LOW)
      finish_item(t);
    end
  endtask
endclass
  
