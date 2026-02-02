module graycode(
    input  [3:0] A,
    output [3:0] G
);
    // Gray = Binary XOR (Binary >> 1)
    assign G[3] = A[3];
    assign G[2] = A[3] ^ A[2];
    assign G[1] = A[2] ^ A[1];
    assign G[0] = A[1] ^ A[0];
endmodule