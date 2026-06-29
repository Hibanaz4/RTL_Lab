module alu_32bit(
input logic clk,
input logic rst,
input logic [31:0] a,
input logic [31:0] b,
input logic [2:0] sel,
output logic [63:0] result
);
logic [31:0] a_reg;
logic [31:0] b_reg;
logic [2:0] sel_reg;

always_ff @(posedge clk or posedge rst)
begin
if(rst)
begin
a_reg <= 0;
b_reg <= 0;
sel_reg <= 0;
result <= 0;
end
else
begin
a_reg <= a;
b_reg <= b;
sel_reg <= sel;

case(sel_reg)
3'b000: result <= a_reg + b_reg;
3'b001: result <= a_reg - b_reg;
3'b010: result <= a_reg * b_reg;

3'b011:
if(b_reg != 0)
result <= a_reg / b_reg;
else
result <= 0;
3'b100: result <= a_reg & b_reg;
3'b101: result <= a_reg | b_reg;
3'b110: result <= a_reg << 1;
3'b111: result <= a_reg >> 1;

default: result <= 0;
endcase
end
end

endmodule
