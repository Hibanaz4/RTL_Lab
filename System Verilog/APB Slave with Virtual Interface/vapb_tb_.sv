module tb_top;

logic pclk = 0;
logic preset = 1;
logic [31:0] read_data = '0;

always #5 pclk = ~pclk;

// Instantiate Physical Interface
apb_if intf (pclk, preset);

// Instantiate DUT
apb_slave dut (intf.slave);

// Virtual Interface Pointer
virtual apb_if.master v_apb_if;

// APB Write Task via Virtual Interface
task apb_write(input logic [31:0] addr, input logic [31:0] data);
@(posedge v_apb_if.pclk);
// Setup Phase
v_apb_if.paddr <= addr;
v_apb_if.pwdata <= data;
v_apb_if.pwrite <= 1'b1;
v_apb_if.psel <= 1'b1;
v_apb_if.penable <= 1'b0;

@(posedge v_apb_if.pclk);
// Access Phase
v_apb_if.penable <= 1'b1;

@(posedge v_apb_if.pclk);
// Idle Phase
v_apb_if.psel <= 1'b0;
v_apb_if.penable <= 1'b0;
v_apb_if.pwrite <= 1'b0;
v_apb_if.paddr <= '0;
v_apb_if.pwdata <= '0;
endtask

// APB Read Task via Virtual Interface
task apb_read(input logic [31:0] addr, output logic [31:0] data);
@(posedge v_apb_if.pclk);
// Setup Phase
v_apb_if.paddr <= addr;
v_apb_if.pwrite <= 1'b0;
v_apb_if.psel <= 1'b1;
v_apb_if.penable <= 1'b0;

@(posedge v_apb_if.pclk);
// Access Phase
v_apb_if.penable <= 1'b1;

@(posedge v_apb_if.pclk);
data = v_apb_if.prdata;
// Idle Phase
v_apb_if.psel <= 1'b0;
v_apb_if.penable <= 1'b0;
v_apb_if.paddr <= '0;
endtask

// Main Test Sequence
initial begin
// Bind Virtual Interface
v_apb_if = intf.master;

// Drive Initial 0 Values at Time 0
v_apb_if.paddr <= '0;
v_apb_if.pwdata <= '0;
v_apb_if.psel <= 1'b0;
v_apb_if.penable <= 1'b0;
v_apb_if.pwrite <= 1'b0;

// Apply Reset
preset = 1;
#20;
preset = 0;

$display("[TB] Writing 0x12345678 to Address 0x10...");
apb_write(32'h10, 32'h12345678);

$display("[TB] Reading from Address 0x10...");
apb_read(32'h10, read_data);

$display("[TB] Read Data Result = 0x%08X", read_data);

#20;
$finish;
end

endmodule
