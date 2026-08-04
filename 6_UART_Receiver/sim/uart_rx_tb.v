module tb ();
reg clk;
reg rst;
reg rx_in;
wire baud_tick;
wire [7:0] rx_data;
wire rx_done;

baud_gen uut (.clk(clk),.rst(rst),.baud(baud_tick));
uart_rx dut (.clk(clk),.rst(rst),.rx_in(rx_in),.baud_tick(baud_tick),.rx_data(rx_data),.rx_done(rx_done));
always #5 clk = ~clk;
initial begin 
    clk = 0;
    rst = 1;
    rx_in = 1;
    #100;
    rst = 0;
    #100;
    send_byte(8'b10101010);
    #200000;
    send_byte(8'b00111100);
    #200000;
    $finish;
end
task send_byte (input[7:0] data_to_send);
integer i;
begin
rx_in = 1'b0;
#104167;
for(i=0;i<8;i=i+1)begin
    rx_in= data_to_send[i];
    #104167;
end
rx_in = 1'b1;
#104167;
end
endtask
endmodule