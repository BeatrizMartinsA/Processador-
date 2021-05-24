module mux_ula(ALUsrc, dado_leitura2, extensor, saida);
input [31:0] dado_leitura2, extensor;
input ALUsrc;
output reg [31:0] saida;

always @(ALUsrc)
	begin
		if (ALUsrc)
			begin
				saida = extensor;
			end
		else
			begin
				saida = dado_leitura2;
			end
	end
endmodule
