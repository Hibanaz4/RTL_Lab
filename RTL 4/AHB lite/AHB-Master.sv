module ahb_lite_master #(
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
output logic done,
output logic [ADDR_WIDTH-1:0] haddr,
output logic [1:0] htrans,
output logic hwrite,
output logic [DATA_WIDTH-1:0] hwdata,
input logic [DATA_WIDTH-1:0] hrdata,
input logic hready
);

localparam IDLE = 2'b00;
localparam BUSY = 2'b01;
localparam NONSEQ = 2'b10;
localparam SEQ = 2'b11;

typedef enum logic [1:0] {
ST_IDLE = 2'b00,
ST_ADDR = 2'b01,
ST_DATA = 2'b10
} state_t;

state_t state, next_state;

logic [ADDR_WIDTH-1:0] haddr_reg;
logic [DATA_WIDTH-1:0] hwdata_reg;
logic hwrite_reg;
logic [1:0] htrans_reg;

always_ff @(posedge clk or negedge rst_n) begin
if (!rst_n) begin
state <= ST_IDLE;
haddr_reg <= '0;
hwdata_reg <= '0;
hwrite_reg <= 1'b0;
htrans_reg <= IDLE;
req_rdata <= '0;
end else begin
state <= next_state;

if (state == ST_IDLE && start) begin
haddr_reg <= req_addr;
hwdata_reg <= req_wdata;
hwrite_reg <= write_req;

case (cmd_type)
2'b00: htrans_reg <= IDLE;
2'b01: htrans_reg <= BUSY;
2'b10: htrans_reg <= NONSEQ;
2'b11: htrans_reg <= SEQ;
default: htrans_reg <= IDLE;
endcase
end
if (state == ST_DATA && hready && !hwrite_reg) begin
req_rdata <= hrdata;
end
end
end
always_comb begin
next_state = state;
case (state)
ST_IDLE: begin
if (start) next_state = ST_ADDR;
end
ST_ADDR: begin
next_state = ST_DATA;
end
ST_DATA: begin
if (hready) next_state = ST_IDLE;
end
default: next_state = ST_IDLE;
endcase
end
assign haddr = (state == ST_ADDR) ? haddr_reg : '0;
assign htrans = (state == ST_ADDR) ? htrans_reg : IDLE;
assign hwrite = (state == ST_ADDR) ? hwrite_reg : 1'b0;
assign hwdata = (state == ST_DATA) ? hwdata_reg : '0;
assign done = (state == ST_DATA) && hready;
endmodule
