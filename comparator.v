module compare(
    input  [3:0] A,
    input  [3:0] B,
    output [2:0] CMP
);
    assign CMP[0] = (A == B); // Equal flag
    assign CMP[1] = (A >  B); // Greater flag
    assign CMP[2] = (A <  B); // Lesser flag
endmodule