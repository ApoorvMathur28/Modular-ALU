`timescale 1ns/1ps
module alu_tb;
    reg  [3:0] A, B;
    reg  [2:0] opcode;
    reg  [2:0] logic_sel;
    wire [7:0] result;
    wire       carry_out, borrow_out, parity_out;
    wire [3:0] quot_out, rem_out;
    wire [2:0] cmp_out;

    
    alu_top uut (
        .A(A), .B(B),
        .opcode(opcode),
        .logic_sel(logic_sel),
        .result(result),
        .carry_out(carry_out),
        .borrow_out(borrow_out),
        .quot_out(quot_out),
        .rem_out(rem_out),
        .cmp_out(cmp_out),
        .parity_out(parity_out)
    );

    integer i, j; 

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, alu_tb);

        $display("===============================================================================================");
        $display("Time | opcode | logic_sel |  A  |  B  | result | carry | borrow | parity | cmp_out | quot | rem");
        $display("===============================================================================================");

       
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i[3:0];
                B = j[3:0];

                // 000 - ADD
                opcode = 3'b000; logic_sel = 3'b000; #10;
                // 001 - SUB
                opcode = 3'b001; #10;
                // 010 - MUL
                opcode = 3'b010; #10;
                // 011 - DIV
                opcode = 3'b011; #10;
                // 100 - LOGIC (cycle through logic_sel)
                opcode = 3'b100;
                for (logic_sel = 3'b000; logic_sel <= 3'b110; logic_sel = logic_sel + 1)
                    #10;
                // 101 - GRAY CODE
                opcode = 3'b101; #10;
                // 110 - PARITY
                opcode = 3'b110; #10;
                // 111 - COMPARATOR
                opcode = 3'b111; #10;

                #10;
            end
        end

        $display("===============================================================================================");
        $display("Simulation complete for all combinations of A and B.");
        $finish;
    end

    initial begin
        #200000000;
        $display("Timeout reached - stopping simulation.");
        $finish;
    end
endmodule
