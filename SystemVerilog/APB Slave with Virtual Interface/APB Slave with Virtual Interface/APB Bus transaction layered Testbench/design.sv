interface apb_interface(input logic clk);
logic presetn;
logic psel;
logic penable;
logic pwrite;
logic [31:0] paddr;
logic [31:0] pwdata;
logic [31:0] prdata;
logic pready;
logic pslverr;
endinterface


module apb_dut(apb_interface vif);
reg [31:0] memory[0:255];
integer i;

initial begin
for(i=0;i<256;i=i+1)
memory[i]=32'h0;
end

always @(posedge vif.clk) begin
if(!vif.presetn) begin
vif.pready<=0;
vif.prdata<=0;
vif.pslverr<=0;
end
else if(vif.psel&&vif.penable) begin
vif.pready<=1;
vif.pslverr<=0;

if(vif.pwrite)
memory[vif.paddr[7:0]]<=vif.pwdata;
else
vif.prdata<=memory[vif.paddr[7:0]];
end
else begin
vif.pready<=0;
end
end
endmodule
