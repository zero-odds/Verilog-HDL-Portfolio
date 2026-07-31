module baud_gen (
    input clk,rst,
    output reg baud
);
reg [9:0] count;
always@(posedge clk or posedge rst)begin
    if(rst) begin
    count <=0;
    baud<=1'b0;
    end  else if (count == 650) begin
    count<=0;
    baud <= 1'b1;
    end else begin
    count <= count + 1'b1;
    baud <= 1'b0;
end
end
endmodule