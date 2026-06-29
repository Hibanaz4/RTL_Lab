module decoder2to4_tb();

    logic [1:0] i;
    logic [3:0] y;

    decoder2to4 dut (
        .i(i),
        .y(y)
    );

    initial begin
        i = 2'b00; #10;
        i = 2'b01; #10;
        i = 2'b10; #10;
        i = 2'b11; #10;

        $finish;
    end

endmodule
