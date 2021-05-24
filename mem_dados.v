module mem_dados (dado_leitura, dado_escrita, endereco, clock, clock_write, MemWrite, MemRead);

input [31:0] dado_escrita;
input [31:0] endereco;
input clock, clock_write, MemWrite, MemRead;

output reg [31:0] dado_leitura;

// Declare the RAM variable
reg [31:0] mem[2**8-1:0];

always @ (posedge clock)
	begin
		// Read
		if (MemRead)
			dado_leitura = mem[endereco];
	end
	
always @ (negedge clock_write)
	begin
		if (MemWrite)
			mem[endereco] = dado_escrita;
	end

endmodule
