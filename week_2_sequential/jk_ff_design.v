module jk_ff(input clk, j,k,output reg q);
  initial begin
    q=1'b0;
  end
  always@(posedge clk) begin
    case({j,k})
      2'b00:q<=0;
      2'b01:q<=0;
      2'b10:q<=1;
      2'b11:q<= ~q;
    endcase
  end
endmodule