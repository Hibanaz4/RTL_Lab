module sr_ff (
input logic clk,
input logic s,
input logic r,
output logic q
);
always_ff @(posedge clk) begin
if (s == 0 && r == 0)
q <= q;         
else if (s == 0 && r == 1)
q <= 1'b0;       
else if (s == 1 && r == 0)
q <= 1'b1;      
else
q <= 1'bx;      
end
endmodule
