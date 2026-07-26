module tb;
logic clk = 0;
logic rst_n = 0;
logic hsync;
logic vsync;
logic [3:0] red;
logic [3:0] green;
logic [3:0] blue;
vga_sram_top dut (
.clk(clk),
.rst_n(rst_n),
.hsync(hsync),
.vsync(vsync),
.red(red),
.green(green),
.blue(blue)
);

always #20 clk = ~clk;
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, tb);
end
initial begin
rst_n = 0;
#80;
rst_n = 1;
#1000;
$finish;
end
endmodule
