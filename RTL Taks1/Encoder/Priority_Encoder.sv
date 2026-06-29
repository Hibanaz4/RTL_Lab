module priority_encoder4to2 (
    input  logic [3:0] i,
    output logic [1:0] y
);

always_comb begin
    casez (i)
        4'b1???: y = 2'b11; // i3 highest priority
        4'b01??: y = 2'b10; // i2
        4'b001?: y = 2'b01; // i1
        4'b0001: y = 2'b00; // i0
        default: y = 2'b00;
    endcase
end

endmodule
