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
  
  add_if vif();
  
  add dut(.a(vif.a),.b(vif.b),.y(vif.y));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    uvm_config_db#(virtual add_if)::set(null,"uvm_test_top.e.agt.*","vif",vif);
    run_test("test");
  end
  
endmodule
