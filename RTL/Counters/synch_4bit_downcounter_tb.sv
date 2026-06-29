module synch_4bit_downcounter_tb;
logic clk;
logic rst;
logic [3:0] q;

synch_4bit_downcounter dut(
.clk(clk),
.rst(rst),
.q(q)
);
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
#10 rst=0;
#100 $finish;
end
endmodule
