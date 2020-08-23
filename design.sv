// Design
// D flip-flop
module dff(clk, reset,d, q);
  input      clk;
  input      reset;
  input      d;
  output     q;

  reg        q;


  always @(posedge clk or posedge reset)
  begin
    if (reset) begin
      // Asynchronous reset when reset goes high
      q <= 1'b0;
    end else begin
      // Assign D to Q on positive clock edge
      q <= d;
    end
  end
endmodule

module shift_register(q0,q1,q2,q3,q4,q5,q6,q7,d,clk,reset);
  
  input d,clk,reset;
  output q0,q1,q2,q4,q5,q6,q7,q3;
  
  assign q0 = dff(clk, reset,d,q0);
  assign q1 = dff(clk, reset,q0,q1);
  assign q2 = dff(clk, reset,q1,q2);
  assign q3 = dff(clk, reset,q2,q3);
  assign q4 = dff(clk, reset,q3,q4);
  assign q5 = dff(clk, reset,q4,q5);
  assign q6 = dff(clk, reset,q5,q6);
  assign q7 = dff(clk, reset,q6,q7);
endmodule
