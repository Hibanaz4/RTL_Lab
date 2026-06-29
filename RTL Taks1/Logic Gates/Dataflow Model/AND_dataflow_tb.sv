module and_df_tb();

    logic a, b;
    logic y;

    and_df dut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
       
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
