module tb;
reg clk;
reg rst;
reg seq_in;
wire det_out;
seq_detector_1011 uut(.clk(clk),.rst(rst),.seq_in(seq_in),.det_out(det_out));
always #5 clk = ~clk;
initial begin
    clk = 0;
    rst = 1;
    seq_in = 0;
    #10;
    rst = 0;
    #10 seq_in = 1;
    #10 seq_in = 0;
    #10 seq_in = 1;
    #10 seq_in = 1;

    #10 seq_in = 0;
    #10 seq_in = 1;
    #10 seq_in = 1;
    #10 seq_in = 0;
    #10 seq_in = 0;
    #20 $finish;
end
endmodule