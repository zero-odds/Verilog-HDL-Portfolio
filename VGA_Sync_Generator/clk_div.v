module clk_div(
input clk,
input rst,
output pixel_clk
);
reg [1:0] counter;
always@(posedge clk ) begin
if(rst) begin
counter<=2'b00;
end else begin
counter <= counter + 1;
end
end
assign pixel_clk = counter[1];
endmodule