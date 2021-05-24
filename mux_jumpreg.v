module mux_jumpreg(JumpReg, dado_leitura1, i25_0, saida);
input [25:0] i25_0;
input [31:0] dado_leitura1;
input JumpReg;
output reg [25:0] saida;

always @(JumpReg)
	begin
		if(JumpReg)
			begin
				saida = dado_leitura1[25:0];
			end
		else
			begin
				saida = i25_0;
			end
	end

endmodule
