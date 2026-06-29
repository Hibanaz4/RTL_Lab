module sync_4bit_upcounter_tb;
logic clk;
logic rst;
logic [3:0] q;
sync_4bit_upcounter dut(
.clk(clk),
.rst(rst),
.q(q)
);

always #5 clk=~clk;
initial begin
clk=0;
rst=1;
#10 rst=0;
#200 $finish;
end
endmodule
