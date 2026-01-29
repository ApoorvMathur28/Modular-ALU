
module alu_top(
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] opcode,
    input  [2:0] logic_sel,     // Used only when opcode = 100 (logic operations)
    output reg [7:0] result,
    output reg       carry_out,
    output reg       borrow_out,
    output     [3:0] quot_out,
    output     [3:0] rem_out,
    output     [2:0] cmp_out,     // Comparator result flags
    output            parity_out
);

   
    wire [3:0] sum, diff, logic_out, gray_out;
    wire [7:0] prod;
    wire [3:0] quot, rem;
    wire add_cout, sub_bout;
    wire even_parity;
    wire [2:0] cmp_result;

   
    add      U_ADD  (.A(A), .B(B), .SUM(sum), .carry_out(add_cout));
    sub      U_SUB  (.A(A), .B(B), .DIFF(diff), .borrow_out(sub_bout));
    mul      U_MUL  (.A(A), .B(B), .PROD(prod));
    div      U_DIV  (.A(A), .B(B), .QUOT(quot), .REM(rem));
    logic_op U_LOG  (.A(A), .B(B), .logic_sel(logic_sel), .OUT(logic_out));
    graycode U_GRAY (.A(A), .G(gray_out));
    parity   U_PAR  (.A(A), .even_parity(even_parity));
    compare  U_COMP (.A(A), .B(B), .CMP(cmp_result));

    assign quot_out = quot;
    assign rem_out  = rem;
    assign parity_out = even_parity;
    assign cmp_out = cmp_result;

    // ALU control logic
    always @(*) begin
        result = 8'b00000000;
        carry_out = 1'b0;
        borrow_out = 1'b0;

        case (opcode)
            3'b000: begin // ADD
                result = {4'b0000, sum};
                carry_out = add_cout;
            end

            3'b001: begin // SUB
                result = {4'b0000, diff};
                borrow_out = sub_bout;
            end

            3'b010: result = prod; // MUL

            3'b011: result = {4'b0000, quot}; // DIV

            3'b100: result = {4'b0000, logic_out}; // LOGIC ops

            3'b101: result = {4'b0000, gray_out}; // GRAY CODE

            3'b110: result = {7'b0000000, even_parity}; // PARITY

            3'b111: result = {5'b00000, cmp_result}; // COMPARATOR

            default: result = 8'b00000000;
        endcase
    end
endmodule