module multiplier_tb;

    logic [3:0] a, b;
    logic [7:0] product;

    multiplier_for dut (
        .a(a),
        .b(b),
        .product(product)
    );

    initial begin
        a = 4'b0111; b = 4'b0011; #10;  // 7 × 3 = 21
        a = 4'b1111; b = 4'b0001; #10;  // 15 × 1 = 15
        a = 4'b0010; b = 4'b0010; #10;  // 2 × 2 = 4
        a = 4'b0110; b = 4'b1001; #10;  // 6 × 9 = 54

        $finish;
    end

endmodule
