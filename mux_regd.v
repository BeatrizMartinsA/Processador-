module mux_regd(Reg2,RegD, RegDest, saida);
input RegDest;
input [4:0] Reg2, RegD;
output reg [4:0] saida;

always @(RegDest)
	begin
		if(RegDest)
			begin
				saida = RegD;
			end
		else
			begin
				saida = Reg2;
			end
	end

endmodule
