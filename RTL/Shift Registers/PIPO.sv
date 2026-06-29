module pipo(
input logic clk,
input logic rst,
input logic [3:0] par_in,
output logic [3:0] par_out
);

always_ff @(posedge clk or posedge rst)
begin
if(rst)
par_out<=4'b0000;
else
par_out<=par_in;
end

endmodule
