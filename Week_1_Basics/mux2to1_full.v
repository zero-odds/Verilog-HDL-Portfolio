module mux2to1(input I0,I1,S,output Y);
assign Y = S ? I0:I1;
endmodule

module tb_mux2to1;
    reg I0, I1, S;
    wire Y;

    mux2to1 uut (.I0(I0), .I1(I1), .S(S), .Y(Y));

    initial begin
        $monitor("S=%b I0=%b I1=%b | Y=%b", S, I0, I1, Y);
        I0=0; I1=1; S=0;  #10;  // Y = 0 (selects I0)
        I0=0; I1=1; S=1;  #10;  // Y = 1 (selects I1)
        I0=1; I1=0; S=0;  #10;  // Y = 1 (selects I0)
        I0=1; I1=0; S=1;  #10;  // Y = 0 (selects I1)
        $finish;
    end
endmodule