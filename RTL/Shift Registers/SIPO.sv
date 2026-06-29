module sipo(
input logic clk,
input logic rst,
input logic ser_in,
output logic [3:0] par_out
);

logic [3:0] shift_reg;
always_ff @(posedge clk or posedge rst)
begin
if(rst)
shift_reg<=4'b0000;
else
shift_reg<={ser_in,shift_reg[3:1]};
end

assign par_out=shift_reg;
endmodule
