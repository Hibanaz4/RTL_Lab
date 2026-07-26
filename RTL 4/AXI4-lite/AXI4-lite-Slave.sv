module axi_slave #(
parameter ADDR_WIDTH = 32,
parameter DATA_WIDTH = 32)
(
input logic clk,
input logic rst,
// Write Address 
input logic [ADDR_WIDTH-1:0] awaddr,
input logic awvalid,
output logic awready,
// Write Data 
input logic [DATA_WIDTH-1:0] wdata,
input logic wvalid,
output logic wready,
// Write Response 
output logic bvalid,
input logic bready,
// Read Address 
input logic [ADDR_WIDTH-1:0] araddr,
input logic arvalid,
output logic arready,
// Read Data 
output logic [DATA_WIDTH-1:0] rdata,
output logic rvalid,
input logic rready
);
logic [DATA_WIDTH-1:0] mem;

always_ff @(posedge clk or posedge rst)
begin
if(rst)
begin
awready <= 0;
wready <= 0;
bvalid <= 0;
arready <= 0;
rvalid <= 0;
rdata <= 0;
mem <= 0;
end
  
else
begin
awready <= 1;
wready <= 1;
arready <= 1;
if(awvalid && wvalid)
begin
mem <= wdata;
bvalid <= 1;
end
if(bvalid && bready)
begin
bvalid <= 0;
end
if(arvalid)
begin
rdata <= mem;
rvalid <= 1;
end
if(rvalid && rready)
begin
rvalid <= 0;
end
end
end
endmodule
