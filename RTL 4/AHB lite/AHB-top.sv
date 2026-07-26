module ahb_lite_top #(
parameter DATA_WIDTH = 32,
parameter ADDR_WIDTH = 10
)(
input logic clk,
input logic rst_n,
input logic [1:0] cmd_type,
input logic start,
input logic write_req,
input logic [ADDR_WIDTH-1:0] req_addr,
input logic [DATA_WIDTH-1:0] req_wdata,
output logic [DATA_WIDTH-1:0] req_rdata,
output logic done
);
logic [ADDR_WIDTH-1:0] haddr;
logic [1:0] htrans;
logic hwrite;
logic [DATA_WIDTH-1:0] hwdata;
logic [DATA_WIDTH-1:0] hrdata;
logic hready;
logic hresp;
logic hsel;

assign hsel = (htrans == 2'b10 || htrans == 2'b11);

ahb_lite_master #(
.DATA_WIDTH(DATA_WIDTH),
.ADDR_WIDTH(ADDR_WIDTH)
) master_inst (
.clk(clk),
.rst_n(rst_n),
.cmd_type(cmd_type),
.start(start),
.write_req(write_req),
.req_addr(req_addr),
.req_wdata(req_wdata),
.req_rdata(req_rdata),
.done(done),
.haddr(haddr),
.htrans(htrans),
.hwrite(hwrite),
.hwdata(hwdata),
.hrdata(hrdata),
.hready(hready)
);
ahb_lite_slave #(
.DATA_WIDTH(DATA_WIDTH),
.ADDR_WIDTH(ADDR_WIDTH)
) slave_inst (
.clk(clk),
.rst_n(rst_n),
.hsel(hsel),
.haddr(haddr),
.htrans(htrans),
.hwrite(hwrite),
.hwdata(hwdata),
.hrdata(hrdata),
.hreadyout(hready),
.hresp(hresp)
);
endmodule



