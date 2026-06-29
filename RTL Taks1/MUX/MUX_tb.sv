module mux_tb();

    logic [3:0] I;
    logic [1:0] sel;
    logic y;

    mux4to1 dut (.I(I), .sel(sel), .y(y));

    initial begin

        // 1st input 
        I = 4'b1010;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        // 2nd input 
        I = 4'b1100;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        // 3rd input 
        I = 4'b0111;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish;
    end

endmodule