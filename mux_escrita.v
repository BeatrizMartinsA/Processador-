module mux_escrita(Resultado_ULA, dado_leitura, MemtoReg, saida);
input MemtoReg;
input [31:0] Resultado_ULA, dado_leitura;
output reg [31:0] saida;

always @(MemtoReg)
	begin
		if(MemtoReg)
			begin
				saida = dado_leitura;
			end
		else
			begin
				saida = Resultado_ULA;
			end
	end

endmodule

