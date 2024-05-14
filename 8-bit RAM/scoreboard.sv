class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  uvm_analysis_imp#(transaction,scoreboard) rec_port;
  
  //perform comparison with golden data
  reg [7:0] temp_arr[20] = '{default:0};
  
  function new(string name="SCOREBOARD",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //t = transaction::type_id::create("t");
    rec_port=new("rec_port",this);
  endfunction
  
  virtual function void write(transaction data);
    
    if(data.wr == 1'b1) begin
      temp_arr[data.addr] = data.din;
      `uvm_info("SBD",$psprintf("MON->SBD, DATA WRITE OP: addr=%0d, din=%0d", data.addr, data.din),UVM_LOW)
    end
    
    if(data.wr == 1'b0) begin
      if(data.dout == temp_arr[data.addr])
        `uvm_info("SBD",$psprintf("TEST PASSED: DATA READ OP: addr=%0d, din=%0d, dout=%0d", data.addr, data.din, data.dout),UVM_LOW)
        else
          `uvm_error("SBD",$psprintf("TEST FAILED: DATA READ OP: addr=%0d, din=%0d, dout=%0d", data.addr, data.din, data.dout));
    end
    $display("-------------------------------------------");
  endfunction
endclass
