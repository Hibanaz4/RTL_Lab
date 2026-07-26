module ahb_lite_slave #(
parameter DATA_WIDTH = 32,
parameter ADDR_WIDTH = 10
)(
input logic clk,
input logic rst_n,
input logic hsel,
input logic [ADDR_WIDTH-1:0] haddr,
input logic [1:0] htrans,
input logic hwrite,
input logic [DATA_WIDTH-1:0] hwdata,
output logic [DATA_WIDTH-1:0] hrdata,
output logic hreadyout,
output logic hresp
);
localparam NONSEQ = 2'b10;
localparam SEQ = 2'b11;
logic [DATA_WIDTH-1:0] memory [0:(1<<ADDR_WIDTH)-1];
logic [ADDR_WIDTH-1:0] addr_reg;
logic write_reg;
logic active_reg;
assign hreadyout = 1'b1;
assign hresp = 1'b0;
always_ff @(posedge clk or negedge rst_n) begin
if (!rst_n) begin
addr_reg <= '0;
write_reg <= 1'b0;
active_reg <= 1'b0;
end else if (hreadyout) begin
addr_reg <= haddr;
write_reg <= hwrite;
active_reg <= hsel && ((htrans == NONSEQ) || (htrans == SEQ));
end
end
always_ff @(posedge clk) begin
if (active_reg && write_reg) begin
memory[addr_reg] <= hwdata;
end
end
assign hrdata = (active_reg && !write_reg) ? memory[addr_reg] : '0;
endmodule
