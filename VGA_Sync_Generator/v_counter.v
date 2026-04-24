module v_counter(
    input rst,
    input pixel_clk,
    input [9:0] h_count,
    output reg [9:0] v_count
);
always@(posedge pixel_clk or posedge rst)begin
    if(rst) begin
        v_count <= 10'd0;
    end
    else if(h_count == 10'd799) begin
        if(v_count == 10'd524) begin
            v_count <= 10'd0;
        end 
        else begin
            v_count <= v_count + 1;
        end
    end
end
endmodule