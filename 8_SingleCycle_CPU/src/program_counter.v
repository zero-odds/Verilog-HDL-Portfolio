module program_counter (
    input rst,clk,jump,
    input [7:0] jump_addr,
    output reg [7:0] pc_out
);

always@(posedge clk or posedge rst) begin 
    if (rst) begin 
         pc_out <= 8'b00000000;
    end 
    else if(jump) begin
        pc_out <= jump_addr;
    end
    else 
    pc_out <= pc_out + 1'b1;
end
endmodule