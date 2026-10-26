module cpu_single_cycle(
    input clk,rst,
    input [15:0] instruction,
    output [7:0] alu_out
);
// internal wires 

// program counter wires
wire [7:0] current_pc;

//control unit wires
wire reg_write_sig;
wire [2:0] alu_control_sig;

//register wires
wire [7:0] read_data1_sig;
wire [7:0] read_data2_sig;

//alu wires
wire [7:0] alu_result_sig;
wire alu_zero_sig;

assign alu_out = alu_result_sig;

wire [1:0] opcode_wire = instruction[1:0];
wire [2:0] rs1_wire    = instruction[4:2];
wire [2:0] rs2_wire    = instruction[7:5];
wire [2:0] rd_wire     = instruction[10:8];

program_counter pc_inst (
    .clk(clk),
    .rst(rst),
    .jump(1'b0),
    .jump_addr(8'b0),
    .pc_out(current_pc)
);

control_unit cu_inst (
    .opcode(opcode_wire),
    .reg_write(reg_write_sig),
    .alu_control(alu_control_sig)
);

register_file reg_inst (
    .clk(clk),
    .rst(rst),
    .reg_write(reg_write_sig),
    .rs1_addr(rs1_wire),
    .rs2_addr(rs2_wire),
    .write_addr(rd_wire),
    .write_data(alu_result_sig),
    .read_data1(read_data1_sig),
    .read_data2(read_data2_sig)
);

alu_8bit alu_inst (
    .a(read_data1_sig),
    .b(read_data2_sig),
    .opcode(alu_control_sig),
    .result(alu_result_sig),
    .zero(alu_zero_sig)
);
endmodule
