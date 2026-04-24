module h_counter(
    input rst,
    input pixel_clk,
    output reg [9:0] h_count
);
always@(posedge pixel_clk or posedge rst) begin
    if(rst) begin
        h_count = 10'd0;
    end else if(h_count == 10'd799)begin
        h_count<= 10'd0;
    end else begin
        h_count<=h_count + 1;
    end
end
endmodule