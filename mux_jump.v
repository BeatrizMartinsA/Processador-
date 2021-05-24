module mux_jump(saida_mux_branch, saida_concat, Jump, saida);
input [31:0] saida_mux_branch, saida_concat;
input Jump;
output reg [31:0] saida;

always @(Jump)
	begin
		if(Jump)
			begin
				saida = saida_concat;
			end
		else
			begin
				saida = saida_mux_branch;
			end
	end

endmodule
