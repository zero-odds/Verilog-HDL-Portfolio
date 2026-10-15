module tb;
reg [7:0] a,b;
reg [3:0] opcode;
wire [7:0] result;
wire zero;
alu_8bit ts (.a(a),.b(b),.opcode(opcode),.result(result));
initial begin
    $monitor ("a=%b b=%b opcode=%b result=%b zero=%b", a,b,opcode,result,zero);
    a=5;b=6;opcode:3'b000; #10;
    a=5;b=6;opcode:3'b001; #10;
    a=5;b=6;opcode:3'b010; #10;
    a=5;b=6;opcode:3'b011; #10;
    $finish;
end
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
end
endmodule
    
