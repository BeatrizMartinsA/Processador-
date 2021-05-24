module branch_decision (Branch, Zero, saida);
input Branch, Zero;
output reg saida;
always @(*)
	begin
		if (Branch & Zero)
			begin
				saida = 1'b1;
			end
		else
			begin
				saida = 1'b0;
			end
	end
endmodule
