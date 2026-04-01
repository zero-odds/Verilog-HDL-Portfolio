module d_async_ff(input clk,d,rst,output reg q);
  always@(posedge clk or posedge rst) begin
    if(rst==1'b1)begin
      q<=1'b0;
    end
    else begin
      q<=d;
    end
  end
endmodule