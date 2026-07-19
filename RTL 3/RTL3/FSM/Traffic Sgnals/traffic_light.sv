module traffic_light(
input logic clk,
input logic rst,
output logic red,
output logic yellow,
output logic green
);
parameter RED=2'b00,
YELLOW=2'b01,
GREEN=2'b10;
logic [1:0] curr_state,next_state;

always_ff @(posedge clk or posedge rst)
begin
if(rst)
curr_state<=RED;
else
curr_state<=next_state;
end

always_comb
begin
next_state=curr_state;

case(curr_state)

RED:
begin
next_state=YELLOW;
end

YELLOW:
begin
next_state=GREEN;
end

GREEN:
begin
next_state=RED;
end

default:
next_state=RED;

endcase
end

always_comb
begin

red=0;
yellow=0;
green=0;

case(curr_state)

RED:
red=1;

YELLOW:
yellow=1;

GREEN:
green=1;

endcase

end

endmodule

