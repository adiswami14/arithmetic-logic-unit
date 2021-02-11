module logicunit_test;

    reg A = 0;
    reg B = 0;
    always #1 A = !A;
    always #2 B = !B;

    reg [1:0] control = 0;

    // always #4 control[0] = !control[0];
    // always #8 control[1] = !control[1];

     initial begin
        $dumpfile("logicunit.vcd");
        $dumpvars(0, logicunit_test);

        // control is initially 0
        # 4 control = 1; // wait 16 time units (why 16?) and then set it to 1
        # 4 control = 2; // wait 16 time units and then set it to 2
        # 4 control = 3; // wait 16 time units and then set it to 3
        # 4 $finish; // wait 16 time units and then end the simulation
    end

    wire out;
    logicunit lu(out, A, B, control);
endmodule // logicunit_test
