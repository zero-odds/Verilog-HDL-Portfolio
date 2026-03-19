module full_adder(input A,B,Cin,output Sum,Cout);
wire w1,w2,w3;
xor x1(Sum,A,B,Cin);
and a1(w1,A,B);
and a2(w2,B,Cin);
and a3(w3,Cin,A);
or o1(Cout,w1,w2,w3);
endmodule
module tb;
  reg A, B, Cin;
  wire Sum, Cout;

  full_adder uut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

  initial begin
    $monitor("A=%b B=%b Cin=%b | Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
    A=0; B=0; Cin=0; #10;
    A=0; B=0; Cin=1; #10;
    A=0; B=1; Cin=0; #10;
    A=0; B=1; Cin=1; #10;
    A=1; B=0; Cin=0; #10;
    A=1; B=0; Cin=1; #10;
    A=1; B=1; Cin=0; #10;
    A=1; B=1; Cin=1; #10;
    $finish;
  end
endmodule