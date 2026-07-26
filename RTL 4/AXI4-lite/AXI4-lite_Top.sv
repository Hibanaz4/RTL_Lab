module axi_4lite_top #(
parameter ADDR_WIDTH = 32,
parameter DATA_WIDTH = 32
)
(
input logic clk,
input logic rst);
// Write Address
logic [ADDR_WIDTH-1:0] awaddr;
logic awvalid;
logic awready;
// Write Data
logic [DATA_WIDTH-1:0] wdata;
logic wvalid;
logic wready;
// Write Response
logic bvalid;
logic bready;
// Read Address 
logic [ADDR_WIDTH-1:0] araddr;
logic arvalid;
logic arready;
// Read Data 
logic [DATA_WIDTH-1:0] rdata;
logic rvalid;
logic rready; 
axi_master #(
.ADDR_WIDTH(ADDR_WIDTH),
.DATA_WIDTH(DATA_WIDTH)
)
master
(
.clk(clk),
.rst(rst),
.awaddr(awaddr),
.awvalid(awvalid),
.awready(awready),
.wdata(wdata),
.wvalid(wvalid),
.wready(wready),
.bvalid(bvalid),
.bready(bready),
.araddr(araddr),
.arvalid(arvalid),
.arready(arready),
.rdata(rdata),
.rvalid(rvalid),
.rready(rready)
);
axi_slave #(
.ADDR_WIDTH(ADDR_WIDTH),
.DATA_WIDTH(DATA_WIDTH)
)
 slave(
.clk(clk),
.rst(rst),
.awaddr(awaddr),
.awvalid(awvalid),
.awready(awready),
.wdata(wdata),
.wvalid(wvalid),
.wready(wready),
.bvalid(bvalid),
.bready(bready),
.araddr(araddr),
.arvalid(arvalid),
.arready(arready),
.rdata(rdata),
.rvalid(rvalid),
.rready(rready)
);
endmodule
