module divfreq (clk, clk_escrita);
input clk;
output clk_escrita;

reg [27:0] saida = 28'd0;
parameter DIVISOR = 28'd6;

always @(posedge clk)
	begin
		saida <= saida + 28'd1;
		if(saida >= (DIVISOR-1))
			begin
				saida <= 28'd0;
			end		
	end

assign clk_escrita = (saida < DIVISOR/2)?1'b0:1'b1;
	
endmodule
	