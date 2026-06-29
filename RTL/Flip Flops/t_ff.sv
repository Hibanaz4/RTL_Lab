module t_ff(
    input logic clk,
    input logic reset,
    input logic t,
    output logic q
);

always_ff @(posedge clk or posedge reset) begin
    if (reset)
        q <= 1'b0;
    else if (t)
        q <= ~q;
    else
        q <= q;
end

endmodule
