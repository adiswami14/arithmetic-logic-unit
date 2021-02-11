// 00 -> AND, 01 -> OR, 10 -> NOR, 11 -> XOR
module logicunit(out, A, B, control);
    output      out;
    input       A, B;
    input [1:0] control;

    wire xorw, norw, andw, orw;
  
    xor xor1(xorw, A, B);
    nor nor1(norw, A, B);
    and and1(andw, A, B);
    or or1(orw, A, B);
    
    
    mux4 mux(out, andw, orw, norw, xorw, control);

endmodule // logicunit
