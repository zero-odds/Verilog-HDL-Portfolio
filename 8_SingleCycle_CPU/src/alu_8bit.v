module alu (
    input [7:0] a,b,
    input [3:0] opcode,
    output reg [7:0] result,
    output zero
);
assign zero = (result == 8'b0);
always@(*)begin
    case(opcode)
    3'b000: result = a+b;
    3'b001: result = a-b;
    3'b010: result= a&b;
    3'b011: result = a|b;
    default: result = 8'b0;
    endcase
end
endmodule