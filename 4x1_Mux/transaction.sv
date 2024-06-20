class transaction extends uvm_sequence_item;
  rand bit [3:0] a,b,c,d;
  rand bit [1:0] sel;
  bit [3:0] y;
 
  function new(string name = "txn");
    super.new(name);
  endfunction
 
`uvm_object_utils_begin(transaction)
	`uvm_field_int(a, UVM_DEFAULT)
	`uvm_field_int(b, UVM_DEFAULT)
  `uvm_field_int(c, UVM_DEFAULT)
  `uvm_field_int(d, UVM_DEFAULT)
  `uvm_field_int(sel, UVM_DEFAULT)
  `uvm_field_int(y, UVM_DEFAULT)
  `uvm_object_utils_end
 
endclass
