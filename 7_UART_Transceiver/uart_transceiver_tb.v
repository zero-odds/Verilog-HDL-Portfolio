module tb;
reg clk;
reg rst;
reg rx_in;
wire tx_out;
uart_transceiver dut(
    .clk(clk),
    .rst(rst),
    .rx_in(rx_in),
    .tx_out(tx_out),
);
always #5 clk = ~clk;
localparam BIT_PERIOD = 104167;
    task send_byte;
        input [7:0] data;
        integer i;
        begin
            rx_in = 0;
            #(BIT_PERIOD);

            for (i = 0; i < 8; i = i + 1) begin
                rx_in = data[i];
                #(BIT_PERIOD);
            end

            rx_in = 1;
            #(BIT_PERIOD);
        end
    endtask
    initial begin
        clk = 0;
        rst = 1;
        rx_in = 1; 

        #100;
        rst = 0;
        #100;

        $display("Injecting first byte: 8'h48...");
        send_byte(8'h48);
        
        #(BIT_PERIOD * 15); 

        $display("Injecting second byte: 8'h4A...");
        send_byte(8'h4A);

        #(BIT_PERIOD * 15);

        $display("Loopback simulation complete!");
        $finish;
    end

endmodule