module tb_alu_32bit;
logic clk;
logic rst;
logic [31:0] a;
logic [31:0] b;
logic [2:0] sel;
logic [63:0] result;

alu_32bit dut(
.clk(clk),
.rst(rst),
.a(a),
.b(b),
.sel(sel),
.result(result)
);

always #5 clk = ~clk;

initial
begin
clk = 0;
rst = 1;
a = 0;
b = 0;
sel = 0;

#10 rst = 0;

// Addition
a = 10; b = 5; sel = 3'b000;
#20;

// Subtraction
a = 10; b = 5; sel = 3'b001;
#20;

// Multiplication
a = 10; b = 5; sel = 3'b010;
#20;

// Division
a = 10; b = 5; sel = 3'b011;
#20;

// AND
a = 10; b = 5; sel = 3'b100;
#20;

// OR
a = 10; b = 5; sel = 3'b101;
#20;

// Shift Left
a = 10; b = 0; sel = 3'b110;
#20;

// Shift Right
a = 10; b = 0; sel = 3'b111;
#20;

$finish;
end

initial
$monitor("Time=%0t sel=%b a=%0d b=%0d result=%0d",
$time,sel,a,b,result);

endmodule
