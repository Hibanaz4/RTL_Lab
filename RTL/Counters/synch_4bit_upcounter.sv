module sync_4bit_upcounter(
input logic clk,
input logic rst,
output logic [3:0] q
);
logic t0,t1,t2,t3;

always_ff @(posedge clk or posedge rst)
if(rst)
q[0] <= 0;
else if(t0)
q[0] <= ~q[0];

always_ff @(posedge clk or posedge rst)
if(rst)
q[1] <= 0;
else if(t1)
q[1] <= ~q[1];

always_ff @(posedge clk or posedge rst)
if(rst)
q[2] <= 0;
else if(t2)
q[2] <= ~q[2];

always_ff @(posedge clk or posedge rst)
if(rst)
q[3] <= 0;
else if(t3)
q[3] <= ~q[3];

assign t0 = 1'b1;
assign t1 = q[0];
assign t2 = q[0] & q[1];
assign t3 = q[0] & q[1] & q[2];
endmodule
