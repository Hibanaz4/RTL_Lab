module bcd_to_7seg (
    input  logic [3:0] bcd,
    output logic [6:0] segout
);

always_comb begin
    case (bcd)

        4'b0000: segout = 7'b1111110;
        4'b0001: segout = 7'b0110000;
        4'b0010: segout = 7'b1101101;
        4'b0011: segout = 7'b1111001;
        4'b0100: segout = 7'b0110011;
        4'b0101: segout = 7'b1011011;
        4'b0110: segout = 7'b1011111;
        4'b0111: segout = 7'b1110000;
        4'b1000: segout = 7'b1111111;
        4'b1001: segout = 7'b1111011;

        default: segout = 7'b0000000;

    endcase
end

endmodule
