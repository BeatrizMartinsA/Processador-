module PC (clock, endereco_entrada, saida, stop);

input clock, stop;
input [31:0] endereco_entrada;

output reg [31:0] saida;

reg [3:0] controle;

initial begin
	saida = 0;
end

always @(negedge clock)
	begin
		if(!stop)
			begin
				saida = endereco_entrada;
			end
	end

endmodule
