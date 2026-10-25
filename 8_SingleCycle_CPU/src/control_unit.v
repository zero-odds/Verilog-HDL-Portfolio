module control_unit (
    input [1:0] opcode,
    output reg reg_write,
    output reg [2:0] alu_control 
);
always@(*) begin
    reg_write = 1'b1;
    alu_control = 3'b000;
    
    case (opcode)
     2'b00: alu_control = 3'b000;
     2'b01: alu_control = 3'b001;
     2'b10: alu_control = 3'b010;
     2'b11: alu_control = 3'b011;
     default : begin
        reg_write = 0;
     alu_control = 3'b000;
     end
endcase
end
endmodule


