module add(
    input  [3:0] A, B,
    output [3:0] SUM,
    output       carry_out
);
    wire [4:0] temp;
    assign temp = A + B;
    assign SUM = temp[3:0];
    assign carry_out = temp[4];
endmodule