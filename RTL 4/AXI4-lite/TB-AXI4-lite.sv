module tb_axi_4lite;
parameter ADDR_WIDTH = 32;
parameter DATA_WIDTH = 32;
logic clk;
logic rst;
axi_4lite_top #(
.ADDR_WIDTH(ADDR_WIDTH),
.DATA_WIDTH(DATA_WIDTH)
)
dut
(.clk(clk),
.rst(rst)
);
always #5 clk = ~clk;
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, tb_axi_4lite); 
clk = 0;
rst = 1;
#20;
rst = 0;
#200;
$finish;
end
initial
begin
$monitor("Time=%0t Reset=%b",$time,rst);
end
endmodule
