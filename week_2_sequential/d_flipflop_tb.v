module tb;
reg clk,d;
wire q;
d_ff uut(.clk(clk),.d(d),.q(q));
initial begin
clk=0;
forever #5 clk = ~clk;
end
initial begin
d=0;
#12 d=1;
#15 d=0;
#20 d=1;
#100 $finish;
end
initial begin
$monitor("time=%0t | clk= %b | d=%b | q=%b",$time,clk,d,q);
end
endmodule