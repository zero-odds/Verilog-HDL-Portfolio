module up_counter(input clk,rst,enb,output reg [3:0] count);
  always@(posedge clk) begin 
    if(rst==1)begin
      count=4'b0000;
    end
    if(enb==1)begin
      count<= count + 4'b0001;
    end 
    else begin
      count<=count;
    end
  end
    endmodule