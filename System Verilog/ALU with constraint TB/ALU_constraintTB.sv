class alu_transaction;

rand bit[3:0]a;
rand bit[3:0]b;
rand bit[2:0]opcode;

constraint check_values{
a inside {[0:15]};
b inside {[0:15]};
}

constraint check_op{
opcode dist{
3'b000:=4,
3'b001:=3,
3'b010:=2,
3'b011:=2,
3'b100:=2,
3'b101:=1,
3'b110:=1
};
}

endclass


module tb;
alu_transaction tr;

logic[3:0]a;
logic[3:0]b;
logic[2:0]opcode;
logic[7:0]result;

alu dut(
.a(a),
.b(b),
.opcode(opcode),
.result(result)
);

initial begin
$dumpfile("alu.vcd");
$dumpvars(0,tb);

tr=new();
repeat(20)begin

if(tr.randomize())begin

a=tr.a;
b=tr.b;
opcode=tr.opcode;

#1;

$display("A=%0d B=%0d Opcode=%0d Result=%0d",
a,b,opcode,result);

end
else begin
$display("Randomization failed");
end
end
$display("ALU constrained-random testing completed.");
#10;

$finish;
end
endmodule
