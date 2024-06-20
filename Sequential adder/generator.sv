class generator extends uvm_sequence #(transaction);
`uvm_object_utils(generator)
 
transaction t;
  
function new(input string inst = "GEN");
super.new(inst);
endfunction
 
 
virtual task body();
  t = transaction::type_id::create("t");
  repeat(10) 
    begin
    start_item(t);
    t.randomize();
    finish_item(t);
   `uvm_info("GEN",$sformatf("Data send to Driver a :%0d , b :%0d",t.a,t.b), UVM_NONE);  
    end
endtask
 
endclass
 