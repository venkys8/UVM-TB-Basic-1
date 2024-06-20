class generator extends uvm_sequence #(transaction);
`uvm_object_utils(generator)
 
  transaction tg;
 
  function new(string name = "GEN");
    super.new(name);
  endfunction
 
virtual task body();
  tg = transaction::type_id::create("tg");
  repeat(10) begin
    start_item(tg);
    tg.randomize();
     `uvm_info("GEN",$sformatf("Data send to Driver a :%0d , b :%0d, c:%0d. d:%0d, sel=%0d",tg.a,tg.b,tg.c,tg.d,tg.sel), UVM_NONE);
    finish_item(tg);
  end
endtask
 
endclass
