module bidirectional_shift_register_tb;
logic clk;
logic rst;
logic dir;
logic ser_l;
logic ser_r;
logic [3:0] q;

bidirectional_shift_register dut(
.clk(clk),
.rst(rst),
.dir(dir),
.ser_l(ser_l),
.ser_r(ser_r),
.q(q)
);

always #5 clk = ~clk;
initial begin
clk = 0;
rst = 1;
dir = 0;
ser_l = 1;
ser_r = 0;
#10 rst = 0;
#40 dir = 1;
#40 $finish;
end
endmodule
