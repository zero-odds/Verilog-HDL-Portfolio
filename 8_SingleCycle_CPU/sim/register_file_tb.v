module tb;
reg clk,rst,reg_write;
reg [2:0] rs1_addr,rs2_addr;
reg [2:0] write_addr;
reg [7:0] write_data;
wire [7:0] read_data1,read_data2 ;

register_file test (.clk(clk),.rst(rst),.reg_write(reg_write),.rs1_addr(rs1_addr),
.rs2_addr(rs2_addr),.write_addr(write_addr),.write_data(write_data),.read_data1(read_data1),.read_data2(read_data2));

always #5 clk = ~clk;

initial begin 
clk = 0;
rst = 1;
reg_write = 0;
rs1_addr=0;
rs2_addr=0;
write_addr=0;
write_data=0;
#20;
rst =0;
// Test Case 1: Write to Register 3, then read it on Port 1
        #10;
        reg_write = 1;
        write_addr = 3'b011;  
        write_data = 8'hAA;  
        #10;
        reg_write = 0;
        rs1_addr = 3'b011;
        
        // Test Case 2: Write to Register 4 and 5, read both simultaneously
        #10;
        reg_write = 1;
        write_addr = 3'b100; 
        write_data = 8'h55;
        #10;
        write_addr = 3'b101;  
        write_data = 8'hFF;
        #10;
        reg_write = 0;
        rs1_addr = 3'b100;  
        rs2_addr = 3'b101;    

        // Test Case 3: Verify write-enable safety (Should NOT overwrite)
        #10;
        reg_write = 0;       
        write_addr = 3'b100;  
        write_data = 8'h00;   
        #10;
        rs1_addr = 3'b100;    

        // Test Case 4: Verify asynchronous reset clears data
        #10;
        rst = 1;              
        #10;
        rst = 0;
        #100 $finish;
end
endmodule