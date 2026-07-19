module seq_detector_tb;
logic clk;
logic rst;
logic in;
logic out;

seq_det dut(
.clk(clk),
.rst(rst),
.in(in),
.out(out)
);

always #5 clk=~clk;

initial
begin
clk=0;
rst=1;
in=0;

#10 rst=0;

#10 in=1;
#10 in=1;
#10 in=0;
#10 in=1;

#10 in=0;
#10 in=1;
#10 in=0;

#10 in=1;
#10 in=1;
#10 in=0;
#10 in=1;

#20 $finish;
$monitor("Time=%0t clk=%b rst=%b in=%b out=%b",
         $time, clk, rst, in, out);
end

endmodule
