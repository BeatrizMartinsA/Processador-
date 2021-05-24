module banco_regs(Reg1, Reg2, RegD, dado_escrita, dado_leitura1, dado_leitura2, RegWrite, JAL, clock, pc_plus_1);
input [4:0] Reg1, Reg2, RegD;
input RegWrite, JAL, clock;
input [31:0] dado_escrita, pc_plus_1;
output [31:0] dado_leitura1, dado_leitura2;

reg [31:0] regs[31:0];

assign dado_leitura1 = regs[Reg1];
assign dado_leitura2 = regs[Reg2];

always @(negedge clock)
	begin
		regs[0] = 32'b00000000000000000000000000000000;
		//teste 1, 4
		
		/*regs[1] = 32'b00000000000000000000000000001000;
		regs[2] = 32'b00000000000000000000000000000101;
		regs[4] = 32'b00000000000000000000000000000010;
		regs[6] = 32'b00000000000000000000000000000011;
		regs[9] = 32'b00000000000000000000000000000010;
		regs[10] = 32'b00000000000000000000000000000110;
		regs[11] = 32'b00000000000000000000000000000100;*/

		
		//teste2
		/*regs[1] = 32'b00000000000000000000000000000001;
		regs[4] = 32'b00000000000000000000000000000100;
		regs[3] = 32'b00000000000000000000000000000000;
		regs[6] = 32'b00000000000000000000000000000000;*/
		
		//teste 5
		/*regs[0] = 32'b00000000000000000000000000000000;
		regs[1] = 32'b00000000000000000000000000001000;
		regs[2] = 32'b00000000000000000000000000000101;*/
		
		if(JAL)
			begin
				regs[31] = pc_plus_1; // $ra
			end
		
		if(RegWrite)
			begin
				regs[RegD] = dado_escrita;
			end
		
	end
endmodule

	