module tb_siso;
logic clk,rst,ser_in;
logic ser_out;

siso dut(
.clk(clk),
.rst(rst),
.ser_in(ser_in),
.ser_out(ser_out)
);
always #5 clk=~clk;
initial
begin
clk=0;
rst=1;
ser_in=0;

#10 rst=0;
#10 ser_in=1;
#10 ser_in=0;
#10 ser_in=0;
#10 ser_in=1;
#10 $finish;
end
endmodule
