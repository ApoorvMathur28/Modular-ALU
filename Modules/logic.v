// logic_op.v
// 4-bit Bitwise Logic Operations using 3-bit select line
// Supports 7 operations: AND, OR, XOR, XNOR, NAND, NOR, NOT

module logic_op(
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] logic_sel,  // 000=AND, 001=OR, 010=XOR, 011=XNOR, 100=NAND, 101=NOR, 110=NOT(A)
    output [3:0] OUT
);
    assign OUT = (logic_sel == 3'b000) ? (A & B) :        // AND
                 (logic_sel == 3'b001) ? (A | B) :        // OR
                 (logic_sel == 3'b010) ? (A ^ B) :        // XOR
                 (logic_sel == 3'b011) ? ~(A ^ B) :       // XNOR
                 (logic_sel == 3'b100) ? ~(A & B) :       // NAND
                 (logic_sel == 3'b101) ? ~(A | B) :       // NOR
                 (logic_sel == 3'b110) ? (~A) :           // NOT (only A)
                 4'b0000;
endmodule