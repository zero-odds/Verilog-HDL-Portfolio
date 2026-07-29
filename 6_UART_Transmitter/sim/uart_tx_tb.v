module uart_tx_tb ();
reg rst;
reg clk;
reg [7:0] data_in;
reg transmit_start;
wire tx_out;
uart_tx_top uut (.rst(rst),.clk(clk),.data_in(data_in),.transmit_start(transmit_start),.tx_out(tx_out));
always #5 clk = ~clk;
initial begin
    clk=0;
    rst=1;
    transmit_start =0;
    data_in = 8'h00;
        #20;
    rst = 0;
    #100;
    data_in = 8'h48;
    transmit_start = 1;
    #100000;
    transmit_start = 0;
    #1500000;
    $finish;
end
endmodule