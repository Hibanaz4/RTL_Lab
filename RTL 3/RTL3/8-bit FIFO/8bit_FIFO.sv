module fifo_8bit(
input logic clk,
input logic rst,
input logic wr_en,
input logic rd_en,
input logic [7:0] data_in,
output logic [7:0] data_out,
output logic full,
output logic empty
);
logic [7:0] mem [0:7];
logic [2:0] wr_ptr;
logic [2:0] rd_ptr;
logic [3:0] count;

always_ff @(posedge clk or posedge rst)
begin
if(rst)
begin
wr_ptr<=0;
rd_ptr<=0;
count<=0;
data_out<=0;
end
else
begin
if(wr_en && !full)
begin
mem[wr_ptr]<=data_in;
wr_ptr<=wr_ptr+1;
count<=count+1;
end

if(rd_en && !empty)
begin
data_out<=mem[rd_ptr];
rd_ptr<=rd_ptr+1;
count<=count-1;
end

end
end

assign full=(count==8);
assign empty=(count==0);
endmodule
