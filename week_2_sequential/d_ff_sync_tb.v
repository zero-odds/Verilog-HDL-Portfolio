module tb;
  reg clk,d,rst;
  wire q;
  d_sync_ff uut(.clk(clk),.d(d),.rst(rst),.q(q));
  initial begin
    clk=0;
        forever #5 clk= ~clk;
  end
initial begin 
  rst=1;d=0;
  #10 rst=0;d=1;
  #10 d=0;
  #10 d=1;
  #10 rst=1;
  #10 rst=0;
  #10 $finish;
end
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,tb);
end
endmodule