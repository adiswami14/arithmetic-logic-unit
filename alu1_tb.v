module alu1_test;

    reg A = 0;
    reg B= 0;
    reg c_in = 0;

    always #1 A= !A;
    always #2 B= !B;
    always #4 c_in= !c_in;

    reg[2:0] control = 2;

    initial begin
        $dumpfile("alu1.vcd");
        $dumpvars(0, alu1_test);
        
        #8 control = 3;
        #8 control = 4;
        #8 control = 5;
        #8 control = 6;
        #8 control = 7;
        #8 $finish;
    end

    wire out, carryout;
    alu1 alu(out, carryout, A, B, c_in, control);

endmodule
