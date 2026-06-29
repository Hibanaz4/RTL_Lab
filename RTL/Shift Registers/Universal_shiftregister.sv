module universal_shift_register(
input logic clk,
input logic rst,
input logic [1:0] sel,
input logic [3:0] par_in,
input logic ser_l,
input logic sr_in,
output logic [3:0] q
);
always_ff @(posedge clk or posedge rst)
begin
if(rst)
q <= 4'b0000;
else begin
case(sel)
2'b00: q <= q;
2'b01: q <= {sr_in, q[3:1]};
2'b10: q <= {q[2:0], ser_l};
2'b11: q <= par_in;
endcase
end
end
endmodule
