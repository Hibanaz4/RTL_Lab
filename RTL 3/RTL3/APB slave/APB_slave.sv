module APB_slave(
input logic clk,
input logic rst,
input logic sel,
input logic enable,
input logic write,
input logic [3:0] addr,
input logic [7:0] write_data,
output logic [7:0] read_data,
output logic ready
);
logic [7:0] mem [0:15];

always_ff @(posedge clk or negedge rst)
begin
if(!rst)
begin
read_data<=0;
ready<=0;
end
else
begin
ready<=0;
if(sel && enable)
begin
ready<=1;
if(write)
begin
mem[addr]<=write_data;
end
else
begin
read_data<=mem[addr];
end

end
end
end
endmodule
