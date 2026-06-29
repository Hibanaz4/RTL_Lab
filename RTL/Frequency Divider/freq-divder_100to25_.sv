module freq_div_100to25_(
input logic clk,
input logic rst,
output logic clk_out
);
logic [1:0] count;
always_ff @(posedge clk or posedge rst)
begin
if(rst) begin
count <= 0;
clk_out <= 0;
end
else begin
count <= count + 1;

if(count == 2'd1)
clk_out <= ~clk_out;
end
end
endmodule
