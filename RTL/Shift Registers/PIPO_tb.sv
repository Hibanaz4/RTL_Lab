module tb_pipo;
logic clk,rst;
logic [3:0] par_in;
logic [3:0] par_out;

pipo dut(
.clk(clk),
.rst(rst),
.par_in(par_in),
.par_out(par_out)
);
always #5 clk=~clk;
initial
begin
clk=0;
rst=1;
par_in=4'b0000;
#10 rst=0;
#10 par_in=4'b1001;
#10 par_in=4'b1100;

#20 $finish;
end
endmodule
