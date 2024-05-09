class generator extends uvm_sequence#(transaction);
  `uvm_object_utils(generator)
  
  transaction t;
  integer i;
  
  function new(string name="gen");
    super.new(name);
  endfunction
  
  virtual task body();
    t=transaction::type_id::create("t");
    repeat(10) begin
      start_item(t);
      `uvm_info("GEN",$psprintf("data sent to driver, a=%0d,b=%0d",t.a,t.b),UVM_LOW)
      finish_item(t);
    end
  endtask
endclass
