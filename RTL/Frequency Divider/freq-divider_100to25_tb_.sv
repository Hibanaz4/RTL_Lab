module freq_div_100to25_tb_;
logic clk;
logic rst;
logic clk_out;
freq_div_100to25_ dut(
.clk(clk),
.rst(rst),
.clk_out(clk_out)
);
always #10 clk = ~clk;
initial begin
clk = 0;
rst = 1;
#10 rst = 0;
#200 $finish;
end
endmodule
