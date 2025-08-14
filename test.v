`timescale 1ns / 1ps
module test;

    reg [7:0] a, b;
    reg [2:0] opcode;
    wire [7:0] out;
    wire carry, borrow, overflow, zero;

    alu_8_bit tester(.a(a), .b(b), .opcode(opcode), .out(out), .carry(carry), .borrow(borrow), 
                    .overflow(overflow), .zero(zero));

    initial 
    begin

        $dumpfile("alu_8_bit.vcd");
        $dumpvars(0, test);

        // Addition (carry Flag test)
        a = 8'hFF; b = 8'h01; opcode = 3'b000;
        #10;
        $display("time=%0t, a=%h, b=%h, opcode=%b, out=%h, zero=%b, carry=%b, borrow=%b, overflow=%b", 
                 $time, a, b, opcode, out, zero, carry, borrow, overflow);
                 
        // Addition (overflow flag test)
        a = 8'h7F; b = 8'h01; opcode = 3'b000;
        #10;
        $display("time=%0t, a=%h, b=%h, opcode=%b, out=%h, zero=%b, carry=%b, borrow=%b, overflow=%b", 
                 $time, a, b, opcode, out, zero, carry, borrow, overflow);

        // Bitwise AND
        a = 8'h0F; b = 8'h01; opcode = 3'b010;
        #10;
        $display("time=%0t, a=%h, b=%h, opcode=%b, out=%h, zero=%b, carry=%b, borrow=%b, overflow=%b", 
                 $time, a, b, opcode, out, zero, carry, borrow, overflow);

        // Logical left shift
        a = 8'h0F; b = 8'h01; opcode = 3'b101;
        #10;
        $display("time=%0t, a=%h, b=%h, opcode=%b, out=%h, zero=%b, carry=%b, borrow=%b, overflow=%b", 
                 $time, a, b, opcode, out, zero, carry, borrow, overflow);

        $finish;

    end

endmodule
