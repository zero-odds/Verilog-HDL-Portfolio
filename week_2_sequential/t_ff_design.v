module t_ff(input clk,t,output reg q);
  initial begin 
    q =1'b0;
  end
  always @(posedge clk)begin 
    if (t==1'b1) begin
      q<= ~q;
    end
    else begin
      q<=q;
    end
  end
    endmodule