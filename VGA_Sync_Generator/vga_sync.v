module vga_sync(
    input [9:0] h_counter,
    input [9:0] v_counter,
    output h_sync,
    output v_sync,
    output video_on
);
assign h_sync = ~(h_counter >= 656 && h_counter <= 751);
assign v_sync = ~(v_counter >= 490 && v_counter <= 491);
assign video_on = (h_counter <= 639 && v_counter <= 479);
endmodule