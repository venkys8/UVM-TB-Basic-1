class transaction extends uvm_sequence_item;
  `uvm_object_utils(transaction)
  
  rand bit wr;
  rand bit [7:0] din;
  rand bit [3:0] addr;
  bit [7:0] dout;
  
  constraint c1{
    addr == 3;//same addr, to verify that env is working as exp. gen single addr of 10 txns to read back
    		//same data that we wrote in prev txn
  }
  
  function new(string name="TXN");
    super.new(name);
  endfunction
endclass
