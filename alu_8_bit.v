module alu_8_bit (a,b,opcode,out,carry,borrow,zero,overflow);

    input [7:0] a, b;
    input [2:0] opcode;
    output reg [7:0] out;
    output reg zero, overflow, carry, borrow;

    always @(*) 

    begin

        overflow = 0;
        carry = 0;
        borrow = 0;

        case(opcode)

            3'b000: 
            begin

                {carry, out} = a + b;
                overflow = (~(a[7] ^ b[7]) & (a[7] ^ out[7]));  

            end

            3'b001: 
            begin

                {carry, out} = a - b;
                borrow = ~ carry;
                overflow = ((a[7] ^ b[7]) & (a[7] ^ out[7]));    
                                          
            end

            3'b010: out = a & b;
            3'b011: out = a | b;
            3'b100: out = a ^ b;

            3'b101: 
            begin
                carry = a[7];
                out = a << 1;

            end

            3'b110: 
            begin

                carry = a[0];
                out = a >> 1;

            end

            3'b111: out = a;

            default: out = 8'b0;

        endcase

        zero = (out == 8'b00000000);

    end
    
endmodule
