module alu(
input logic[3:0]a,
input logic[3:0]b,
input logic[2:0]opcode,
output logic[7:0]result
);

always_comb begin
case(opcode)
3'b000:result=a+b;
3'b001:result=a-b;
3'b010:result=a&b;
3'b011:result=a|b;
3'b100:result=a^b;
3'b101:result=a<<1;
3'b110:result=a>>1;
default:result=8'd0;
endcase
end

endmodule

