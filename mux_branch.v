module mux_branch(branch_decision, pc, somador, saida);
input [31:0] pc, somador;
input branch_decision;
output reg [31:0] saida;

always @(branch_decision)
	begin
		if(branch_decision)
			begin
				saida = somador;
			end
		else
			begin
				saida = pc;
			end
	end

endmodule
