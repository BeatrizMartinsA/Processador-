module mem_instrucao(endereco_pc, instrucao);

input [31:0] endereco_pc;
output reg [31:0] instrucao;

reg [31:0] mem[(2**8)-1:0];

always @(endereco_pc)
begin
	//teste1
	/*mem[0] = 32'b00000100001000100001100000000000; //add
	mem[1] = 32'b00001000011001000010100000000000; //sub
	mem[2] = 32'b00111000000000000000000000000110; //jal
	mem[3] = 32'b00010100101001100011100000000000; //mult
	//mem[3] = 32'b00100000000000000100000000000000; //mflo
	mem[4] = 32'b00011001000010010000000000000000; //div
	mem[5] = 32'b00011100000000000101000000000000; //mfhi
	mem[6] = 32'b00100101010000000101100010000000; //sll
	mem[7] = 32'b00101001011000000110000010000000; //srl
	mem[8] = 32'b00110011111000000000000000000000; //jr
	//mem[8] = 32'b00101100011001110110100000000000; //slt
	mem[9] = 32'b00000000000000000000000000000000; //stop*/
	
	//teste 2
	/*mem[0] = 32'b00110100000000000000000000000010; //j
	mem[2] = 32'b00110000100000000000000000000000; //jr
	mem[4] = 32'b00010000001000110010100000000000; //or
	mem[5] = 32'b00001100101001100011100000000000; //and
	mem[6] = 32'b00000000000000000000000000000000; //stop*/
	
	//teste 3
	/*mem[0] = 32'b00000100001000100001100000000000; //add
	mem[1] = 32'b00001000011001000010100000000000; //sub
	//mem[2] = 32'b00111101010010111111111111111110; //beq
	//mem[2] = 32'b01000001010010111111111111111110; //bne
	//mem[2] = 32'b01000101010010111111111111111110; //bgt
	//mem[2] = 32'b01001001010010111111111111111110; //blt
	//mem[2] = 32'b01001101010010111111111111111110; //bge
	mem[2] = 32'b01010001010010111111111111111110; //ble
	mem[3] = 32'b00000000000000000000000000000000; //stop*/
	
	//teste 4
	/*mem[0] = 32'b00000100001000100001100000000000; //add
	mem[1] = 32'b01010100011001010000000000001000; //addi
	mem[2] = 32'b00010100101001100011100000000000; //mult
	mem[3] = 32'b00000000000000000000000000000000; //stop*/
	
	//teste 5
	/*mem[0] = 32'b00000100001000100001100000000000; //add
	mem[1] = 32'b01011000000000110000000000000011; //sw
	mem[2] = 32'b01011100000010000000000000000011; //lw
	mem[3] = 32'b01010101000001010000000000000000; //addi
	mem[4] = 32'b00000000000000000000000000000000; //stop*/
	
	//fatorial
	mem[0] = 32'b01010100000000010000000000000001; //addi cont regs[1] = 0 + 1
	mem[1] = 32'b01010100000000100000000000000110; //addi regs[2] = 0 + num_fatorial
	mem[2] = 32'b01010100000000110000000000000001; //addi resultado regs[3] = 0 + 1
	mem[3] = 32'b00111100010000010000000000000011; //beq num_fatorial == cont?
	mem[4] = 32'b00010100011000100001100000000000; //mult resultado * num_fatorial
	mem[5] = 32'b00001000010000010001000000000000; //sub num_fatorial--
	mem[6] = 32'b00110100000000000000000000000011; //jump mem[3]
	mem[7] = 32'b00000000000000000000000000000000; //stop*
	instrucao = mem[endereco_pc];
end

endmodule
