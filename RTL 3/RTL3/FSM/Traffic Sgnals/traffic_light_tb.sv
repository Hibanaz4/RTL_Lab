module traffic_light_tb;

logic clk;
logic rst;
logic red;
logic yellow;
logic green;

traffic_light dut(
.clk(clk),
.rst(rst),
.red(red),
.yellow(yellow),
.green(green)
);

always #10 clk=~clk;

initial
begin

clk=0;
rst=1;
#10 rst=0;

#50 $finish;

end
endmodule
