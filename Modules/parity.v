module parity(
    input  [3:0] A,
    output       even_parity
);
    assign even_parity = ~(^A);
endmodule