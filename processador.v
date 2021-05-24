module processador(clock, clock_escrita, saida_ula,saida_pc, leitura1, dado2_ula, RegDest, saida_mux_regd, saida_mux_escrita, saida_mux_jumpreg, saida_mux_branch, saida_mux_jump, hi, lo, saida_md);
input clock;
output wire [31:0] saida_pc, saida_ula;
output clock_escrita;

wire [31:0] instrucao; 

//sinais de controle
output wire RegDest;
wire RegWrite, ALUsrc, JumpReg, Branch, Jump, MemWrite, MemRead, MemtoReg, Stop, JAL;
wire [4:0] ALUop;

controle unidade_controle(.opcode(instrucao[31:26]), .RegDest(RegDest), .RegWrite(RegWrite), .ALUsrc(ALUsrc), .ALUop(ALUop), .JumpReg(JumpReg), .Branch(Branch), .Jump(Jump), .Stop(Stop), .MemWrite(MemWrite), .MemRead(MemRead), .MemtoReg(MemtoReg), .JAL(JAL));

wire [31:0] pc_plus_1,leitura2, saida_extensor, saida_concat, saida_add_branch;
output wire [31:0] leitura1, dado2_ula, saida_mux_branch, saida_mux_jump,saida_md;
output wire [4:0] saida_mux_regd;
output wire [31:0] saida_mux_escrita;
output wire [25:0] saida_mux_jumpreg;
wire saida_zero, saida_branch;

output wire [31:0] hi, lo;

divfreq clk(.clk(clock), .clk_escrita(clock_escrita));

//caminho de dados
PC pc(.clock(clock_escrita), .endereco_entrada(saida_mux_jump), .saida(saida_pc), .stop(Stop));

mem_instrucao mi(.endereco_pc(saida_pc), .instrucao(instrucao));

add add_pc(.entrada1(saida_pc), .entrada2(1), .saida(pc_plus_1));

mux_jumpreg muxjumpreg(.JumpReg(JumpReg), .dado_leitura1(leitura1), .i25_0(instrucao[25:0]), .saida(saida_mux_jumpreg));

concat concatenador(.entrada_pc(pc_plus_1), .entrada_mux(saida_mux_jumpreg), .saida(saida_concat));

mux_regd reg_destino(.Reg2(instrucao[20:16]), .RegD(instrucao[15:11]), .RegDest(RegDest), .saida(saida_mux_regd));

banco_regs registradores(.Reg1(instrucao[25:21]), .Reg2(instrucao[20:16]), .RegD(saida_mux_regd), .dado_escrita(saida_mux_escrita), .dado_leitura1(leitura1), .dado_leitura2(leitura2),.RegWrite(RegWrite), .JAL(JAL), .clock(clock_escrita), .pc_plus_1(pc_plus_1));

extensor_sinal extensor(.entrada(instrucao[15:0]), .saida(saida_extensor));

add add_branch(.entrada1(pc_plus_1), .entrada2(saida_extensor), .saida(saida_add_branch));

mux_ula muxula(.ALUsrc(ALUsrc), .dado_leitura2(leitura2), .extensor(saida_extensor), .saida(dado2_ula));

ULA ula(.ALUop(ALUop),.clock(clock),.op1(leitura1),.op2(dado2_ula), .Resultado(saida_ula), .Zero(saida_zero), .Hi(hi), .Lo(lo), .Desloc(instrucao[10:6]));

branch_decision(.Branch(Branch), .Zero(saida_zero), .saida(saida_branch));

mux_branch muxbranch(.branch_decision(saida_branch), .pc(pc_plus_1), .somador(saida_add_branch), .saida(saida_mux_branch));

mux_jump muxjump(.saida_mux_branch(saida_mux_branch), .saida_concat(saida_concat), .Jump(Jump), .saida(saida_mux_jump));

mem_dados md(.dado_leitura(saida_md), .dado_escrita(leitura2), .endereco(saida_ula), .clock(clock), .clock_write(clock_escrita),.MemWrite(MemWrite), .MemRead(MemRead));

mux_escrita me(.Resultado_ULA(saida_ula), .dado_leitura(saida_md), .MemtoReg(MemtoReg), .saida(saida_mux_escrita));

endmodule
