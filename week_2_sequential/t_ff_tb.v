module tb;
  reg clk,t;
  wire q;
  t_ff uut(.clk(clk),.t(t),.q(q));
  initial begin 
    clk=0;
    forever #5 clk = ~clk;
  end
  initial begin 
    t=0;
    #10 t=1;
       #20 t=0;
    #100 $finish;
  end
  initial begin 
    $monitor("time=%0t  clk=%b  t=%b  q=%b", $time,clk,t,q);
  end
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule