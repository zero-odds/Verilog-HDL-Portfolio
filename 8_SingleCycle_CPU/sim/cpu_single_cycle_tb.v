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


        uut.reg_inst.registers[1] = 8'h0A; // Decimal 10 (Binary: 0000 1010)
        uut.reg_inst.registers[2] = 8'h05; // Decimal 5  (Binary: 0000 0101)
        uut.reg_inst.registers[5] = 8'hFF; // Decimal 255 (Binary: 1111 1111)
        uut.reg_inst.registers[6] = 8'h00; // Decimal 0   (Binary: 0000 0000)

        // Cycle 1: ADD R1 and R2, store in R3
        // Format: [15:11]unused, [10:8]rd=3, [7:5]rs2=2, [4:2]rs1=1, [1:0]op=0
        // Binary: 00000_011_010_001_00 = 16'h0344
        #10 instruction = 16'h0344;

        // Cycle 2: SUB R3 and R2, store in R4
        // Format: [15:11]unused, [10:8]rd=4, [7:5]rs2=2, [4:2]rs1=3, [1:0]op=1
        // Binary: 00000_100_010_011_01 = 16'h044D
        #10 instruction = 16'h044D;

        // Cycle 3: AND R1 and R5, store in R7
        // Format: [15:11]unused, [10:8]rd=7, [7:5]rs2=5, [4:2]rs1=1, [1:0]op=2
        // Binary: 00000_111_101_001_10 = 16'h07A6
        #10 instruction = 16'h07A6;

        // Cycle 4: OR R6 and R2, store in R0 (Note: typically R0 is hardwired to 0, but we'll test the write anyway)
        // Format: [15:11]unused, [10:8]rd=0, [7:5]rs2=2, [4:2]rs1=6, [1:0]op=3
        // Binary: 00000_000_010_110_11 = 16'h005B
        #10 instruction = 16'h005B;

        #30 $finish;
    end
endmodule