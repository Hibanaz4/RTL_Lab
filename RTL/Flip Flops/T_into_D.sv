module t_into_d(
input logic clk,
input logic rst,
input logic d,
output logic q
);
logic t;
assign t = d ^ q;
t_ff ff(
.clk(clk),
.rst(rst),
.t(t),
.q(q)
);
endmodule
