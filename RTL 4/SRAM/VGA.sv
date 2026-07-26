module vga_sram_top #(
parameter H_ACTIVE = 8,
parameter H_FRONT  = 2,
parameter H_SYNC   = 4,
parameter H_BACK   = 2,
parameter V_ACTIVE = 6,
parameter V_FRONT  = 1,
parameter V_SYNC   = 3,
parameter V_BACK   = 2
)(
input logic clk,
input logic rst_n,
output logic hsync,
output logic vsync,
output logic [3:0] red,
output logic [3:0] green,
output logic [3:0] blue
);

localparam H_TOTAL = H_ACTIVE + H_FRONT + H_SYNC + H_BACK;
localparam V_TOTAL = V_ACTIVE + V_FRONT + V_SYNC + V_BACK;

logic [9:0] h_count = '0;
logic [9:0] v_count = '0;
logic video_on;
logic [9:0] sram_addr;
logic [11:0] sram_data;

always_ff @(posedge clk) begin
if (!rst_n) begin
h_count <= '0;
v_count <= '0;
end else begin
if (h_count == H_TOTAL - 1) begin
h_count <= '0;
if (v_count == V_TOTAL - 1)
v_count <= '0;
else
v_count <= v_count + 1'b1;
end else begin
h_count <= h_count + 1'b1;
end
end
end

assign hsync = ~((h_count >= H_ACTIVE + H_FRONT) && (h_count < H_ACTIVE + H_FRONT + H_SYNC));
assign vsync = ~((v_count >= V_ACTIVE + V_FRONT) && (v_count < V_ACTIVE + V_FRONT + V_SYNC));
assign video_on = (h_count < H_ACTIVE) && (v_count < V_ACTIVE);

assign sram_addr = h_count[9:0];

sram_memory vram (
.addr(sram_addr),
.data_out(sram_data)
);
assign red = video_on ? sram_data[11:8] : 4'h0;
assign green = video_on ? sram_data[7:4] : 4'h0;
assign blue = video_on ? sram_data[3:0] : 4'h0;
endmodule

