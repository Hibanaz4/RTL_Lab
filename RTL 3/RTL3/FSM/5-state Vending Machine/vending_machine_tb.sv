module vending_machine_tb;
logic clk;
logic rst;
logic rup5;
logic rup10;
logic product;

vending_machine dut(
.clk(clk),
.rst(rst),
.rup5(rup5),
.rup10(rup10),
.product(product)
);

always #5 clk=~clk;
initial
begin
$monitor("Time=%0t clk=%b rst=%b rup5=%b rup10=%b product=%b",
$time,clk,rst,rup5,rup10,product);
clk=0;
rst=1;
rup5=0;
rup10=0;

#10 rst=0;

//5 + 10 = 15
#10 rup5=1;
#10 rup5=0;
#10 rup10=1;
#10 rup10=0;
//10 + 10 = 20
#20 rup10=1;
#10 rup10=0;
#10 rup10=1;
#10 rup10=0;
//5 + 5 + 5 = 15
#20 rup5=1;
#10 rup5=0;
#10 rup5=1;
#10 rup5=0;
#10 rup5=1;
#10 rup5=0;

#20 $finish;
end

endmodule