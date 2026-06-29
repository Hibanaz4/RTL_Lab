module mod_n_counter (
input logic clk,
input logic rst,
output logic [3:0] q
);
parameter N = 10;
always_ff @(posedge clk or posedge rst)
begin
if(rst)
q <= 0;
else if(q == N-1)
q <= 0;
else
q <= q + 1;
end
endmodule
