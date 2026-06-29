module multiplier_pipeline(
input logic clk,
input logic rst,
input logic [3:0] a,
input logic [3:0] b,
output logic [7:0] product
);
logic [3:0] a_reg;
logic [3:0] b_reg;
logic [7:0] product_reg;
always_ff @(posedge clk or posedge rst)
begin
if(rst)
begin
a_reg <= 0;
b_reg <= 0;
product_reg <= 0;
end
else
begin
a_reg <= a;
b_reg <= b;
product_reg <= a_reg * b_reg;
end
end
assign product = product_reg;
endmodule
