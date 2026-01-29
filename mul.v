module mul(
    input  [3:0] A, B,
    output [7:0] PROD
);
    assign PROD = A * B;
endmodule