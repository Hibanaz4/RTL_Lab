module seq_det(
input logic clk,
input logic rst,
input logic in,
output logic out);
parameter logic[2:0] S0=3'b000,S1=3'b001,S11=3'b010,S110=3'b011,S1101=3'b100;
logic[2:0] curr_state,next_state;

always_ff@(posedge clk or posedge rst)begin
if(rst)begin
curr_state<=S0;
end else begin
curr_state<=next_state;
end
end

always_comb begin
next_state=curr_state;
out=1'b0;

case(curr_state)

S0:begin
if(in)
next_state=S1;
else
next_state=S0;
end

S1:begin
if(in)
next_state=S11;
else
next_state=S0;
end

S11:begin
if(in)
next_state=S11;
else
next_state=S110;
end

S110:begin
if(in)
next_state=S1101;
else
next_state=S0;
end

S1101:begin
out=1'b1;
if(in)
next_state=S0;
else
next_state=S0;
end

default:next_state=S0;

endcase
end

endmodule
