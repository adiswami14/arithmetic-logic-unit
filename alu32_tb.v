//implement a test bench for your 32-bit ALU
module alu32_test;
    reg [31:0] A = 0, B = 0;
    reg [2:0] control = 0;
    reg [31:0] e_out;
    reg e_overflow, e_zero, e_negative;

    initial begin
        $dumpfile("alu32.vcd");
        $dumpvars(0, alu32_test);

        //ALU ADD tests
             A = 8; B = 4; control = `ALU_ADD; e_out = 12; e_overflow =0; e_zero = 0; e_negative = 0; // try adding 8 and 4
        # 10 A = 2147483647; B = 1; e_out = -2147483648; e_overflow = 1; e_zero = 0; e_negative = 1; // Positive Overflow test
        # 10 A = 5; B = -2; e_out = 3; e_overflow = 0; e_zero = 0; e_negative = 0; // Positive + Negative number test (positive output)
        # 10 A = 5; B = -7; e_out = -2; e_overflow = 0; e_zero = 0; e_negative = 1; // Posit + Neg test (negative output)
        # 10 A = 5; B = -5; e_out = 0; e_overflow = 0; e_zero = 1; e_negative = 0; // Posit + Neg test (0 output)
        # 10 A = 0; B = 0; e_out = 0; e_overflow = 0; e_zero = 1; e_negative = 0; // 0 + 0 
        # 10 A = -2147483648; B = -1; e_out = 2147483647 ;e_overflow = 1; e_zero = 0; e_negative = 0; // Negative Overflow
        # 10 A = -5; B = -5; e_out = -10 ;e_overflow = 0; e_zero = 0; e_negative = 1; // Negative + Negative test

        //ALU Subtract tests
        # 10 A = 2; B = 5; control = `ALU_SUB; e_out = -3; e_overflow =0; e_zero = 0; e_negative = 1;// try subtracting 5 from 2
        # 10 A = 5; B = 2; e_out = 3; e_overflow =0; e_zero = 0; e_negative = 0;
        # 10 A = 2147483647; B = -1; e_out = -2147483648; e_overflow =1; e_zero = 0; e_negative = 1; // 
        # 10 A = 5; B = 5; e_out = 0; e_overflow =0; e_zero = 1; e_negative = 0; // 0 Output
        # 10 A = 0; B = 0; e_out = 0; e_overflow =0; e_zero = 1; e_negative = 0; // 0 Output
        # 10 A = -2147483648; B = 1; e_out = 2147483647; e_overflow = 1; e_zero = 0; e_negative = 0; //negative overflow

        //ALU AND tests
        #10 A = 0; B = 0; control = `ALU_AND; e_out = 0; e_overflow =0; e_zero = 1; e_negative = 0;
        #10 A = 0; B = 1; e_out = 0; e_overflow =0; e_zero = 1; e_negative = 0; //
        #10 A = 1; B = 0; e_out = 0; e_overflow =0; e_zero = 1; e_negative = 0; //
        #10 A = 1; B = 1; e_out = 1; e_overflow =0; e_zero = 0; e_negative = 0; //
        #10 A = 8'hff; B = 8'h83; e_out = B; e_overflow = 0; e_zero = 0; e_negative = 0;
        #10 A = 8'ha3; B = 8'h11; e_out = 8'h01;  e_overflow = 0; e_zero = 0; e_negative = 0;

        // add more test cases here!
        //ALU OR 
        #10 A = 0; B = 0; control = `ALU_OR; e_out = 0; e_overflow = 0; e_zero = 1; e_negative = 0;
        #10 A = 0; B = 1; e_out = 1; e_overflow =0; e_zero = 0; e_negative = 0; //
        #10 A = 1; B = 0; e_out = 1; e_overflow =0; e_zero = 0; e_negative = 0; //
        #10 A = 1; B = 1; e_out = 1; e_overflow =0; e_zero = 0; e_negative = 0; //
        #10 A = 8'hff; B = 8'h83; e_out = A; e_overflow = 0; e_zero = 0; e_negative = 0;
        #10 A = 8'ha3; B = 8'h11; e_out = 8'h93;  e_overflow = 0; e_zero = 0; e_negative = 0;

        //ALU NOR
        #10 A = 0; B = 0; control = `ALU_NOR; e_out = 32'hffffffff; e_overflow =0; e_zero = 0; e_negative = 1;
        #10 A = 0; B = 1; e_out = 32'hfffffffe; e_overflow =0; e_zero = 0; e_negative = 1; //
        #10 A = 32'hffffffff; B = 0; e_out = 0; e_overflow =0; e_zero = 1; e_negative = 0; //
        #10 A = 32'hfffffffe; B = 0; e_out = 1; e_overflow =0; e_zero = 0; e_negative = 0; //
        #10 A = 8'hff; B = 8'h83; e_out = 32'hffffff00; e_overflow = 0; e_zero = 0; e_negative = 1;
        #10 A = 8'ha3; B = 8'h11; e_out = 32'hffffff4c;  e_overflow = 0; e_zero = 0; e_negative = 1;

        //ALU XOR
        #10 A = 0; B = 0; control = `ALU_XOR; e_out = 0; e_overflow =0; e_zero = 1; e_negative = 0;
        #10 A = 0; B = 1; e_out = 1; e_overflow =0; e_zero = 0; e_negative = 0; //
        #10 A = 1; B = 0; e_out = 1; e_overflow =0; e_zero = 0; e_negative = 0; //
        #10 A = 1; B = 1; e_out = 0; e_overflow =0; e_zero = 1; e_negative = 0; //
        #10 A = 8'hff; B = 8'h83; e_out = 8'h7c; e_overflow = 0; e_zero = 0; e_negative = 0;
        #10 A = 8'ha3; B = 8'h11; e_out = 8'hb2;  e_overflow = 0; e_zero = 0; e_negative = 0;

        # 10 $finish;
    end

    wire [31:0] out;
    wire overflow, zero, negative;
    alu32 a(out, overflow, zero, negative, A, B, control);  
endmodule // alu32_test

