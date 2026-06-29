module universal_shift_register_tb;
logic clk;
logic rst;
logic [1:0] sel;
logic [3:0] par_in;
logic ser_l;
logic sr_in;
logic [3:0] q;
universal_shift_register dut(
.clk(clk),
.rst(rst),
.sel(sel),
.par_in(par_in),
.ser_l(ser_l),
.sr_in(sr_in),
.q(q)
);

always #5 clk = ~clk;
initial begin
clk = 0;
rst = 1;
sel = 0;
par_in = 4'b1010;
ser_l = 0;
sr_in = 1;
#10 rst = 0;
#10 sel = 2'b11;
#10 sel = 2'b01;
#10 sel = 2'b10;
#10 sel = 2'b00;
#100 $finish;
end
endmodule
