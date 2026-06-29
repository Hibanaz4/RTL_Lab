module jk_ff_tb();
logic clk;
logic j;
logic k;
logic q;

jk_ff dut (.clk(clk),.j(j),.k(k),.q(q));

always #5 clk = ~clk;

initial begin
    clk = 0;
    j = 0;
    k = 0;
    #10 j = 0; k = 0;   
    #10 j = 0; k = 1;   
    #10 j = 1; k = 0;   
    #10 j = 1; k = 1;  
    #10 j = 1; k = 1;   
    #10 j = 0; k = 0;   

    #20 $finish;
end

endmodule
