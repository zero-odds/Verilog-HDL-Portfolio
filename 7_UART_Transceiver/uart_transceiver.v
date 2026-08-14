module uart_transceiver (
    input wire clk,
    input wire rst,
    input wire rx_in,
    output wire tx_out
);
wire [7:0] loopback_data;
wire rx_done_tick;
uart_rx receiver_inst(
.clk(clk),
.rst(rst),
.rx_in(rx_in),
.rx_data(loopback_data),
.rx_done(rx_done_tick)
);
uart_tx_top transmitter_inst(
    .clk(clk),
    .rst(rst),
    .data_in(loopback_data),
    .transmit_start(rx_done_tick),
    .tx_out(tx_out)
);
endmodule