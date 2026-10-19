module register_file (
    input clk,rst,reg_write,
    input [2:0] rs1_addr,rs2_addr,
    input [2:0] write_addr,
    input [7:0] write_data,
    output [7:0] read_data1,read_data2  
);
reg [7:0] registers [7:0];
integer i;

assign read_data1 = registers[rs1_addr];
assign read_data2 = registers[rs2_addr];

always@(posedge clk) begin
    if(rst)begin
        for(i=0;i<8;i+1)
        registers[i] <= 8'b0;
    end
    else if(reg_write)
    registers[write_addr] <= write_data;
end
endmodule
