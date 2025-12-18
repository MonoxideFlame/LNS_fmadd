module AND2X2(input A, input B, output Y);
    assign Y = A & B;
endmodule



module AOI21X1(input A, input B, input C,  output Y);
    assign Y = ~((A&B)|C);
endmodule



module AOI22X1(input A, input B, input C, input D, output Y);
    assign Y = ~((A&B)|(C&D));
endmodule



module BUFX2(input A, output Y);
    assign Y = A;
endmodule



module INVX1(input A, output Y);
    assign Y = ~A;
endmodule



module INVX2(input A, output Y);
    assign Y = ~A;
endmodule



module MUX2X1(input A, input B, input S, output Y);
    assign Y = ~((S&A) | ((~S)&B)); 
endmodule



module NAND2X1(input A, input B, output Y);
    assign Y = ~(A&B);
endmodule



module NAND3X1(input A, input B, input C, output Y);
    assign Y = ~((A&B)&C);
endmodule



module NOR2X1(input A, input B, output Y);
    assign Y = ~(A|B);
endmodule



module NOR3X1(input A, input B, input C, output Y);
    assign Y = ~((A|B)|C);
endmodule



module OAI21X1(input A, input B, input C, output Y);
    assign Y = ~((A|B)&C);
endmodule



module OAI22X1(input A, input B, input C, input D, output Y);
    assign Y = ~((A|B)&(C|D));
endmodule



module OR2X2(input A, input B, output Y);
    assign Y = A|B;
endmodule



module XNOR2X1(input A, input B, output Y);
    assign Y = ~(A^B);
endmodule



module XOR2X1(input A, input B, output Y);
    assign Y = A^B;
endmodule
