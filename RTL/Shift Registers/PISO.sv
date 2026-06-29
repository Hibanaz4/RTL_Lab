module piso(
input logic clk,
input logic rst,
input logic load,
input logic [3:0] par_in,
output logic ser_out
);

logic [3:0] shift_reg;

always_ff @(posedge clk or posedge rst)
begin
if(rst)
shift_reg<=4'b0000;
else if(load)
shift_reg<=par_in;
else
shift_reg<={1'b0,shift_reg[3:1]};
end

assign ser_out=shift_reg[0];
endmodule
