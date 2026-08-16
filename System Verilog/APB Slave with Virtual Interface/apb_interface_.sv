interface apb_if (input logic pclk, input logic preset);
  logic [31:0] paddr;
  logic        psel;
  logic        penable;
  logic        pwrite;
  logic [31:0] pwdata;
  logic [31:0] prdata;
  logic        pready;

  modport slave (
    input  pclk, preset, paddr, psel, penable, pwrite, pwdata,
    output prdata, pready
  );

  modport master (
    input  pclk, preset, prdata, pready,
    output paddr, psel, penable, pwrite, pwdata
  );
endinterface
