`include "uvm_macros.svh"
import uvm_pkg::*;

`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"
`include "test.sv"

module top;
  
  mux_if vif();
  
  mux dut(.a(vif.a),.b(vif.b),.c(vif.c),.d(vif.d),.sel(vif.sel),.y(vif.y));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    uvm_config_db#(virtual mux_if)::set(null,"uvm_test_top.e.agt.*","vif",vif);
    run_test("test");
  end
  
endmodule
