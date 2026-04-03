module tb;
reg clk,rst,enb;
  wire [3:0] count;
  up_counter uut(.clk(clk),.rst(rst),.enb(enb),.count(count));
  initial begin
    clk=0;
    forever #5 clk= ~clk;
  end
  initial begin 
    rst=1;enb=0;
    #10 rst=0;enb=1;
   #200;
   $finish;
  end
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule