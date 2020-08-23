// Testbench
module test;

  reg clk;
  reg reset;
  reg d;
  wire q0,q1,q2,q3,q4,q5,q6,q7;
  
  // Instantiate design under test
  shift_register shift(.clk(clk), .reset(reset),
                       .d(d), .q0(q0),.q1(q1),.q2(q2),.q3(q3),.q4(q4),.q5(q5),.q6(q6),.q7(q7));
          
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    $display("Register State");
    clk = 0;
    reset = 1;
    d = 1'bx;
    display;
    
    $display("Rgister State");
    d = 1;
    reset = 0;
    display;

    $display("Toggle clk.");
    clk = 1;
    display;
  end
  
  task display;
    #1 $display("d:%0h, q0:%0h, q1:%0h, q2:%0h, q3:%0h, q4:%0h, q5:%0h, q6:%0h, q7:%0h",
    d, q0,q1,q2,q3,q4,q5,q6,q7);
  endtask

endmodule
