module d_ff_tb();

logic clk;
logic  d;
logic  q;

d_ff dut ( .clk(clk),.d(d),.q(q));

always #2 clk = ~clk;

initial begin
   
    clk = 0;
    d = 0;

    // Apply test values
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;

    #20 $finish;
end

endmodule
