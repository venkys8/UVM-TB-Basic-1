`include "uvm_macros.svh"
import uvm_pkg::*;

`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "env.sv"
`include "test.sv"

module top;
  
  mem_intf vif();
  
  ram dut(.clk(vif.clk), .wr(vif.wr), .din(vif.din), .addr(vif.addr), .dout(vif.dout));
  
  initial begin
    vif.clk=0;
  end
  
  always #10 vif.clk = ~vif.clk;
  
  initial begin
    uvm_config_db#(virtual mem_intf)::set(null,"*","vif",vif);
    run_test("test");
  end    
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
