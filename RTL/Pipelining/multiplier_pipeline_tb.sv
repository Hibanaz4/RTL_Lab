module multiplier_pipeline_tb;
logic clk;
logic rst;
logic [3:0] a;
logic [3:0] b;
logic [7:0] product;
multiplier_pipeline dut(
.clk(clk),
.rst(rst),
.a(a),
.b(b),
.product(product)
);
always #5 clk = ~clk;
initial begin
clk = 0;
rst = 1;
a = 0;
b = 0;
#10 rst = 0;
#10 a = 4'd5; b = 4'd4;
#10 a = 4'd8; b = 4'd5;
#40 $finish;
end
endmodule
