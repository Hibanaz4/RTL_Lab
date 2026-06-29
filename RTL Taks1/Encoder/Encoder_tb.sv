module encoder_4to2_tb;

    logic [3:0] i;
    logic [1:0] y;

    encoder_4to2 dut (
        .i(i),
        .y(y)
    );

    initial begin 
        i = 4'b0001; #10;
        i = 4'b0010; #10;
        i = 4'b0100; #10;
        i = 4'b1000; #10;
        //invalid
        i = 4'b1010; #10;

        $finish;
    end

endmodule
