module t_ff_tb();
logic clk;
logic reset;
logic t;
logic q;

t_ff dut(.clk(clk),.reset(reset),.t(t),.q(q));

always #5 clk=~clk;

initial begin
clk=0;
reset=1;
t=0;

#10 reset=0;
#10 t=0;
#10 t=1;
#10 t=1;
#10 t=0;
#10 t=1;
#10 t=1;

#20 $finish;
end
endmodule
