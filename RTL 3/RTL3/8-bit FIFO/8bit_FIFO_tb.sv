module fifo_8bit_tb;
logic clk;
logic rst;
logic wr_en;
logic rd_en;
logic [7:0] data_in;
logic [7:0] data_out;
logic full;
logic empty;

fifo_8bit dut(
.clk(clk),
.rst(rst),
.wr_en(wr_en),
.rd_en(rd_en),
.data_in(data_in),
.data_out(data_out),
.full(full),
.empty(empty)
);

always #5 clk=~clk;

initial
begin

clk=0;
rst=1;
wr_en=0;
rd_en=0;
data_in=0;

#10 rst=0;

// Test Case 1: Write one data
wr_en=1;
data_in=8'h11;
#10;
wr_en=0;

// Test Case 2: Write multiple data
wr_en=1;
data_in=8'h22;
#10;
data_in=8'h33;
#10;
data_in=8'h44;
#10;
wr_en=0;

// Test Case 3: Read one data
rd_en=1;
#10;
rd_en=0;

// Test Case 4: Read remaining data
rd_en=1;
#30;
rd_en=0;

// Test Case 5: Fill FIFO
wr_en=1;
data_in=8'hAA; #10;
data_in=8'hBB; #10;
data_in=8'hCC; #10;
data_in=8'hDD; #10;
data_in=8'hEE; #10;
data_in=8'hFF; #10;
data_in=8'h55; #10;
data_in=8'h66; #10;
wr_en=0;

// Test Case 6: Empty FIFO
rd_en=1;
#80;
rd_en=0;

#20 $finish;

end

endmodule
