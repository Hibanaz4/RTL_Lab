module sram_memory (
input logic [9:0] addr,
output logic [11:0] data_out
);

logic [11:0] mem [0:1023];

initial begin
for (int i = 0; i < 1024; i++) begin
mem[i] = (i % 3 == 0) ? 12'hF00 :
(i % 3 == 1) ? 12'h0F0 :
12'h00F;
end
end
assign data_out = mem[addr];

endmodule
