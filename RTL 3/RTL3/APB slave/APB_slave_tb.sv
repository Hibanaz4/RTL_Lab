module APB_slave_tb;
logic clk;
logic rst;
logic sel;
logic enable;
logic write;
logic [3:0] addr;
logic [7:0] write_data;
logic [7:0] read_data;
logic ready;
APB_slave dut(
.clk(clk),
.rst(rst),
.sel(sel),
.enable(enable),
.write(write),
.addr(addr),
.write_data(write_data),
.read_data(read_data),
.ready(ready)
);

always #5 clk=~clk;
initial
begin
clk=0;
rst=0;
sel=0;
enable=0;
write=0;
addr=0;
write_data=0;

#10 rst=1;
// Write 55 to address 2//
sel=1;
write=1;
addr=4'd2;
write_data=8'd55;
#10 enable=1;
#10;
sel=0;
enable=0;

// Write 13 to address 5//
#10;
sel=1;
write=1;
addr=4'd5;
write_data=8'd13;
#10 enable=1;
#10;
sel=0;
enable=0;
// Read from address 2//
#10;
sel=1;
write=0;
addr=4'd2;
#10 enable=1;
#10;
sel=0;
enable=0;

#20 $finish;

end
endmodule
