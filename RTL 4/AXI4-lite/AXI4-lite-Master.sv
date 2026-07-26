module axi_master #(
parameter ADDR_WIDTH = 32,
parameter DATA_WIDTH = 32)
(
input logic clk,
input logic rst,
// Write Address
output logic [ADDR_WIDTH-1:0] awaddr,
output logic awvalid,
input logic awready,
// Write Data 
output logic [DATA_WIDTH-1:0] wdata,
output logic wvalid,
input logic wready,
// Write Response 
input logic bvalid,
output logic bready,
// Read Address 
output logic [ADDR_WIDTH-1:0] araddr,
output logic arvalid,
input logic arready,
// Read Data 
input logic [DATA_WIDTH-1:0] rdata,
input logic rvalid,
output logic rready
);
parameter IDLE       = 3'b000,
          WRITE_ADDR = 3'b001,
          WRITE_RESP = 3'b010,
          READ_ADDR  = 3'b011,
          READ_DATA  = 3'b100,
          DONE       = 3'b101;
logic [2:0] state;
always_ff @(posedge clk or posedge rst)
begin
if(rst)
begin
state <= IDLE;
awaddr <= 0;
awvalid <= 0;
wdata <= 0;
wvalid <= 0;
bready <= 0;
araddr <= 0;
arvalid <= 0;
rready <= 0;
end
else begin

case(state)
IDLE:
begin
awaddr <= 32'h00000004;
wdata <= 32'h12345678;
awvalid <= 1;
wvalid <= 1;
state <= WRITE_ADDR;
end

WRITE_ADDR:
begin
if(awready && wready)
begin
awvalid <= 0;
wvalid <= 0;
bready <= 1;
state <= WRITE_RESP;
end
end
  
WRITE_RESP:
begin
if(bvalid)
begin
bready <= 0;
araddr <= 32'h00000004;
arvalid <= 1;
state <= READ_ADDR;
end
end

READ_ADDR:
begin
if(arready)
begin
arvalid <= 0;
rready <= 1;
state <= READ_DATA;
end
end

READ_DATA:
begin
if(rvalid)
begin
rready <= 0;
$display("Read Data = %h",rdata);
state <= DONE;
end
end
DONE:
begin
end
endcase
end
end
endmodule
