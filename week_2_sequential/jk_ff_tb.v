module tb;
  reg clk,j,k;
  wire q;
  jk_ff uut(.clk(clk),.j(j),.k(k),.q(q));
  initial begin 
    clk=0;
    forever #5 clk = ~clk;
  end
  initial begin 
  j=0;k=0;
    #10 j=0;k=1;
    #20 j=1;k=0;
    #30 j=1;k=1;
    #100 $finish;
  end
  initial begin 
    $monitor("time=%0t  clk=%b  j=%b k=%b  q=%b", $time,clk,j,k,q);
  end
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule