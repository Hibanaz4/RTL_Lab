module tb_sipo;
logic clk,rst,ser_in;
logic [3:0] par_out;
sipo dut(
.clk(clk),
.rst(rst),
.ser_in(ser_in),
.par_out(par_out)
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
#20 $finish;
end
endmodule

