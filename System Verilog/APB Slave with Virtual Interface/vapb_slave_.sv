module apb_slave (
apb_if.slave slave_if
);

logic [31:0] mem [0:255];

always_ff @(posedge slave_if.pclk or posedge slave_if.preset) begin

if (slave_if.preset) begin
slave_if.prdata <= 32'h0;
slave_if.pready <= 1'b0;
end else begin
slave_if.pready <= 1'b1;

if (slave_if.psel && slave_if.penable) begin

if (slave_if.pwrite) begin
mem[slave_if.paddr[7:0]] <= slave_if.pwdata;
end else begin
slave_if.prdata <= mem[slave_if.paddr[7:0]];
end
end

end
end
endmodule
