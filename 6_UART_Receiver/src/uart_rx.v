module uart_rx (
    input rst,
    input clk,
    input rx_in,
    input baud_tick,
    output reg [7:0] rx_data,
    output reg rx_done
);

localparam IDLE  = 2'b00;
localparam START = 2'b01;
localparam DATA  = 2'b10;
localparam STOP  = 2'b11;

reg [1:0] state;
reg [3:0] tick_count;
reg [2:0] bit_index;
reg [7:0] shift_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state      <= IDLE;
        tick_count <= 4'd0;
        bit_index  <= 3'd0;
        shift_reg  <= 8'd0;
        rx_data    <= 8'd0;
        rx_done    <= 1'b0;
    end else begin
        rx_done <= 1'b0;
        case (state)
            IDLE: begin
                tick_count <= 4'd0;
                bit_index  <= 3'd0;
                if (rx_in == 1'b0) begin
                    state <= START;
                end
            end
            START: begin
                if (baud_tick) begin
                    if (tick_count == 4'd7) begin 
                        if (rx_in == 1'b0) begin
                            tick_count <= 4'd0;
                            state      <= DATA;
                        end else begin
                            state <= IDLE;
                        end
                    end else begin
                        tick_count <= tick_count + 1'b1;
                    end
                end
            end

            DATA: begin
                if (baud_tick) begin
                    if (tick_count == 4'd15) begin
                        tick_count <= 4'd0;
                        shift_reg  <= {rx_in, shift_reg[7:1]};

                        if (bit_index == 3'd7) begin
                            state <= STOP;
                        end else begin
                            bit_index <= bit_index + 1'b1;
                        end
                    end else begin
                        tick_count <= tick_count + 1'b1;
                    end
                end
            end

            STOP: begin
                if (baud_tick) begin
                    if (tick_count == 4'd15) begin
                        rx_data <= shift_reg;
                        rx_done <= 1'b1;
                        state   <= IDLE;
                    end else begin
                        tick_count <= tick_count + 1'b1;
                    end
                end
            end

            default: state <= IDLE;
        endcase
    end
end

endmodule