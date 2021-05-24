module concat(entrada_pc,entrada_mux, saida);
input [31:0] entrada_pc;
input [25:0] entrada_mux;

output [31:0] saida;

assign saida = {entrada_pc[31:26],entrada_mux};

endmodule
