module bidirectional_shift_register(
input logic clk,
input logic rst,
input logic dir,
input logic ser_l,
input logic ser_r,
output logic [3:0] q
);
always_ff @(posedge clk or posedge rst)
begin
if(rst)
q <= 4'b0000;
else begin
if(dir)
q <= {ser_r, q[3:1]};
else
q <= {q[2:0], ser_l};
end
end
endmodule
