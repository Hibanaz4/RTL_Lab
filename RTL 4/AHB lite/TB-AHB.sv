module tb_ahb;
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 10;

logic clk = 0;
logic rst_n = 0;

logic [1:0] cmd_type;
logic start;
logic write_req;
logic [ADDR_WIDTH-1:0] req_addr;
logic [DATA_WIDTH-1:0] req_wdata;
logic [DATA_WIDTH-1:0] req_rdata;
logic done;

always #5 clk = ~clk;
ahb_lite_top #(
.DATA_WIDTH(DATA_WIDTH),
.ADDR_WIDTH(ADDR_WIDTH)
) top_inst (
.clk(clk),
.rst_n(rst_n),
.cmd_type(cmd_type),
.start(start),
.write_req(write_req),
.req_addr(req_addr),
.req_wdata(req_wdata),
.req_rdata(req_rdata),
.done(done)
);
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, tb_ahb);
rst_n = 0;
start = 0;
cmd_type = 2'b00;
write_req = 0;
req_addr = 0;
req_wdata = 0;
#20;
rst_n = 1;
@(posedge clk);

@(posedge clk);
cmd_type <= 2'b10;
write_req <= 1'b1;
req_addr <= 10'h004;
req_wdata <= 32'hDEADBEEF;
start <= 1'b1;
@(posedge clk);
start <= 1'b0;
wait(done);
@(posedge clk);

@(posedge clk);
cmd_type <= 2'b10;
write_req <= 1'b0;
req_addr <= 10'h004;
req_wdata <= 32'h0;
start <= 1'b1;
@(posedge clk);
start <= 1'b0;
wait(done);
@(posedge clk);

@(posedge clk);
cmd_type <= 2'b01;
write_req <= 1'b1;
req_addr <= 10'h008;
req_wdata <= 32'hCAFEBABE;
start <= 1'b1;
@(posedge clk);
start <= 1'b0;
wait(done);
@(posedge clk);

@(posedge clk);
cmd_type <= 2'b00;
write_req <= 1'b0;
req_addr <= 10'h000;
req_wdata <= 32'h0;
start <= 1'b1;
@(posedge clk);
start <= 1'b0;
wait(done);
@(posedge clk);

@(posedge clk);
cmd_type <= 2'b11;
write_req <= 1'b1;
req_addr <= 10'h008;
req_wdata <= 32'h12345678;
start <= 1'b1;
@(posedge clk);
start <= 1'b0;
wait(done);
@(posedge clk);
#50;
$finish;
end
endmodule
