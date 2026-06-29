module or_behv(
    input logic a, b,
    output logic y
);
always_comb begin
    y = a | b;
end

endmodule
