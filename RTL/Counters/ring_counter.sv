module ring_counter(
input logic clk,
input logic rst,
output logic [3:0] q
);
always_ff @(posedge clk or posedge rst)
begin
if(rst)
q <= 4'b0001;
else
q <= {q[2:0], q[3]};
end
endmodule
