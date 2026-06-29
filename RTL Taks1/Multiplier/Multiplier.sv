module multiplier_for (
    input  logic [3:0] a,
    input  logic [3:0] b,
    output logic [7:0] product
);

integer i;

always_comb begin
    product = 8'b0000000;

    for (i = 0; i < 4; i = i + 1) begin
        if (b[i])
            product = product + (a << i);
    end
end

endmodule
