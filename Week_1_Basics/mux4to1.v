module mux4to1(
  input I0, I1, I2, I3,
  input S0, S1,
  output Y
);
  assign Y = S1 ? (S0 ? I3 : I2) : (S0 ? I1 : I0);
endmodule

module tb;
  reg I0, I1, I2, I3, S0, S1;
  wire Y;

  mux4to1 uut (.I0(I0),.I1(I1),.I2(I2),.I3(I3),.S0(S0),.S1(S1),.Y(Y));

  initial begin
    $monitor("S1=%b S0=%b | Y=%b", S1, S0, Y);
    I0=1; I1=0; I2=1; I3=0;
    S1=0; S0=0; #10; // selects I0 → Y=1
    S1=0; S0=1; #10; // selects I1 → Y=0
    S1=1; S0=0; #10; // selects I2 → Y=1
    S1=1; S0=1; #10; // selects I3 → Y=0
    $finish;
  end
endmodule