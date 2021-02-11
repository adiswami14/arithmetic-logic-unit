# arithmetic-logic-unit
Building a simple Arithmetic Logic Unit in Verilog, tested on a Linux x86_64 system.

#### How It Works
Basically, how an arithmetic logic unit (ALU) works is that a 32-bit ALU is just a chain of 32 1-bit ALUs. Within each 1-bit ALU is a multiplexer that determines whether a bitwise operation is to be performed (XOR, NOR, AND, OR) or an arithmetic operation is to be performed. This 32-bit ALU takes in 2 inputs, and a control variable that indicates the operation to be performed, and produces functional results. 
