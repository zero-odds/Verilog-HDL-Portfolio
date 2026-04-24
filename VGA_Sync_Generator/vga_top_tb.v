module tb;
reg clk;
reg rst;
wire h_sync;
wire v_sync;
wire [11:0] rgb;
vga_top uut (.clk(clk),.rst(rst),.h_sync(h_sync),.v_sync(v_sync),.rgb(rgb));
always #5 clk = ~clk;
initial begin
    clk = 0;
    rst = 1;
    #100;

    rst=0;
    #3000000;
    $stop;
end
endmodule