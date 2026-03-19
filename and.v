module and_gate(
  input a,
  input b,
  output c
);
  assign c = a & b;
endmodule

module tb;
  reg a, b;
  wire c;

  and_gate uut (.a(a), .b(b), .c(c));

  initial begin
    $monitor("a=%b b=%b c=%b", a, b, c);
    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;
    $finish;
  end
endmodule