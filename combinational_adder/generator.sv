class generator extends uvm_sequence #(transaction);
`uvm_object_utils(generator)
 
  transaction t;
 
  function new(string name = "GEN");
    super.new(name);
  endfunction
 
virtual task body();
  t = transaction::type_id::create("t");
  repeat(10) begin
    start_item(t);
    t.randomize();
    `uvm_info("GENERATOR",$sformatf("Data send to Driver a :%0d , b :%0d",t.a,t.b), UVM_NONE);
    finish_item(t);
  end
endtask
 
endclass
