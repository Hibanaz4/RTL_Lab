module vending_machine(
input logic clk,
input logic rst,
input logic rup5,
input logic rup10,
output logic product
);

parameter IDLE=3'b000,
          FIVE=3'b001,
          TEN=3'b010,
          FIFTEEN=3'b011,
          DISPENSE=3'b100;

logic [2:0] curr_state,next_state;

always_ff @(posedge clk or posedge rst)
begin
if(rst)
curr_state<=IDLE;
else
curr_state<=next_state;
end

always_comb
begin
next_state=curr_state;
product=0;

case(curr_state)

IDLE:
begin
if(rup5)
next_state=FIVE;
else if(rup10)
next_state=TEN;
end

FIVE:
begin
if(rup5)
next_state=TEN;
else if(rup10)
next_state=FIFTEEN;
end

TEN:
begin
if(rup5)
next_state=FIFTEEN;
else if(rup10)
next_state=DISPENSE;
end

FIFTEEN:
begin
next_state=DISPENSE;
end

DISPENSE:
begin
product=1;
next_state=IDLE;
end

default:
next_state=IDLE;

endcase
end

endmodule
