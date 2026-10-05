module baud_gen (
input rst,
input clk,
output reg baud
);
reg [13:0] counter;
always@(posedge clk) begin
    if(rst == 1'b1) begin
    counter <= 0;
    baud <= 0;
    end  
    else if(counter == 10416) begin
    counter<=0;
    baud<= 1'b1;
    end 
    else begin
        counter <= counter + 1'b1;
        baud <= 0;
    end
end
endmodule