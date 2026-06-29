module bcd_to_7seg_tb;

    logic [3:0] bcd;
    logic [6:0] segout;

    bcd_to_7seg dut (
        .bcd(bcd),
        .segout(segout)
    );

    initial begin
        bcd = 4'b0000; #10;
        bcd = 4'b0001; #10;
        bcd = 4'b0010; #10;
        bcd = 4'b0011; #10;
        bcd = 4'b0100; #10;
        bcd = 4'b0101; #10;
        bcd = 4'b0110; #10;
        bcd = 4'b0111; #10;
        bcd = 4'b1000; #10;
        bcd = 4'b1001; #10;

        $finish;
    end

endmodule
