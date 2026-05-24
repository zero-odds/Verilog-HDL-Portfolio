module uart_tx_fsm (
    input clk,
    input rst,
    input [7:0] data_in,
    input baud_tick,
    input transmit_start,
    output reg tx_out
);
localparam IDLE = 2'b00;
localparam START = 2'b01;
localparam DATA = 2'b10;
localparam STOP = 2'b11;

reg [1:0] state;
reg [7:0] shift_reg;
reg [2:0] bit_index;
 always@(posedge clk) begin
    if (rst == 1'b1)begin
        state <= IDLE;
        tx_out <= 1'b1;
        bit_index <= 0;
        shift_reg <= 0;
    end
    else begin 
        case(state)
  IDLE: begin
    tx_out<=1'b1;
    if(transmit_start == 1'b1)begin
    shift_reg <= data_in;
     state <= START;
    end
  end
START: begin
    if(baud_tick == 1) begin
        tx_out <= 0;
        state <= DATA;
    end
end
DATA: begin
    if(baud_tick == 1'b1)begin
        tx_out<= shift_reg[0];
        shift_reg<= shift_reg >> 1;
   if(bit_index == 7) begin
        bit_index <= 0;
        state<= STOP;
   end else begin
        bit_index <= bit_index + 1'b1;
    end
end
end
STOP: begin
    if(baud_tick == 1'b1)begin
        tx_out<= 1'b1;
        state <= IDLE;
    end
end
default:state<= IDLE;
        endcase
    end
 end
endmodule