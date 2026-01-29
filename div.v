module div(
    input  [3:0] A, B,
    output [3:0] QUOT,
    output [3:0] REM
);
    assign QUOT = (B != 0) ? (A / B) : 4'b0000;
    assign REM  = (B != 0) ? (A % B) : 4'b0000;
endmodule