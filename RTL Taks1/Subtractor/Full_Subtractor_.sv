module full_subtractor (
    input  logic a,
    input  logic b,
    input  logic bin,
    output logic diff,
    output logic bout
);

assign diff = a ^ b ^ bin;

assign bout = (~a & b) | (~a & bin) | (b & bin);

endmodule
