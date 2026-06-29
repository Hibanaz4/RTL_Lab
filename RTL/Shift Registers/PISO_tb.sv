module tb_piso;
logic clk,rst,load;
logic [3:0] par_in;
logic ser_out;
piso dut(
.clk(clk),
.rst(rst),
.load(load),
.par_in(par_in),
.ser_out(ser_out)
);
always #5 clk=~clk;
initial
begin
clk=0;
rst=1;
load=0;
par_in=4'b0000;

#10 rst=0;
par_in=4'b1000;
load=1;
#10 load=0;
#50 $finish;
end
endmodule
