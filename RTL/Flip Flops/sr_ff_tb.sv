module sr_ff_tb();

logic clk;
logic s;
logic r;
logic q;
sr_ff dut(.clk(clk),.s(s),.r(r),.q(q));
 always #5 clk = ~clk;
initial begin
clk=0;
s=0;
r=0;
#10 s=1 ; r=0;
#10 s=0 ; r=1;
#10 s=0 ; r=0;
#10 s=1 ; r=1;

#10 $finish;
 end
endmodule
