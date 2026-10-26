module cpu_single_cycle_tb;
    reg clk;
    reg rst;
    reg [15:0] instruction;
    wire [7:0] alu_out;

    cpu_single_cycle uut (
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .alu_out(alu_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        instruction = 16'b0;

        #20 rst = 0;

        // Backdoor data injection to test the ALU
        uut.reg_inst.registers[1] = 8'h0A; 
        uut.reg_inst.registers[2] = 8'h05;

        // Cycle 1: ADD R1 and R2, store in R3
        // Format: [15:11]unused, [10:8]rd=3, [7:5]rs2=2, [4:2]rs1=1, [1:0]op=0
        #10 instruction = 16'h0344;

        // Cycle 2: SUB R3 and R2, store in R4
        // Format: [15:11]unused, [10:8]rd=4, [7:5]rs2=2, [4:2]rs1=3, [1:0]op=1
        #10 instruction = 16'h044D;

        #30 $finish;
    end
endmodule
