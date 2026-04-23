module vga_top (
    input clk,
    input rst,
    output h_sync,
    output v_sync,
    output [11:0] rgb
);
wire pixel_clk;
wire [9:0] h_counter;
wire [9:0] v_counter;
wire video_on;

clk_div cd (.clk(clk),.rst(rst),.pixel_clk(pixel_clk));
h_counter hc (.rst(rst),.pixel_clk(pixel_clk),.h_count(h_counter));
v_counter vc (.rst(rst),.pixel_clk(pixel_clk),.h_count(h_counter),.v_count(v_counter));
vga_sync vg (.h_counter(h_counter),.v_counter(v_counter),.h_sync(h_sync),.v_sync(v_sync),.video_on(video_on));
reg [11:0] rgb_reg;
always@(*) begin 
    if(video_on) begin
        rgb_reg = 12'h000;
    end else begin 
        if(h_counter <= 10'd213) begin
            rgb_reg = 12'hf00;
        end
        else if(h_counter <= 10'd426)begin
            rgb_reg = 12'h0f0;
        end
        else begin
            rgb_reg = 12'h00f;
        end
    end
end
assign rgb = rgb_reg;
endmodule
