module uart_tx_top(
    input clk,
    input rst,
    input [7:0] data_in,
    input transmit_start,
    output tx_out
);
wire internal_tick;
baud_gen my_baudchip (.clk(clk),.rst(rst),.baud(internal_tick));
uart_tx_fsm my_fsmchip(.clk(clk),.rst(rst),.data_in(data_in),.transmit_start(transmit_start),.tx_out(tx_out),.baud_tick(internal_tick));
endmodule