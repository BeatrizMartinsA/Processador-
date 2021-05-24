module controle(opcode, RegDest, RegWrite, ALUsrc, ALUop, JumpReg, Branch, Jump, Stop, MemWrite, MemRead, MemtoReg, JAL);
input [5:0] opcode;
output reg RegDest, RegWrite, ALUsrc, JumpReg, Branch, Jump, Stop, MemWrite, MemRead, MemtoReg, JAL;
output reg [4:0] ALUop;

always @(*)
	begin
		case(opcode)
			
			//NOP
			6'b000000: 
				begin
					RegDest = 0;
					RegWrite = 0;
					ALUsrc = 0;
					ALUop = 5'b11111;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 1;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
		
			//TIPO R
			6'b000001: //add
				begin
					RegDest = 1;
					RegWrite = 1;
					ALUsrc = 0;
					ALUop = 5'b00010;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b000010: //sub
				begin
					RegDest = 1;
					RegWrite = 1;
					ALUsrc = 0;
					ALUop = 5'b00011;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
			
			6'b000011: //and
				begin
					RegDest = 1;
					RegWrite = 1;
					ALUsrc = 0;
					ALUop = 5'b00000;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b000100: //or
				begin
					RegDest = 1;
					RegWrite = 1;
					ALUsrc = 0;
					ALUop = 5'b00001;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b000101: //mult
				begin
					RegDest = 1;
					RegWrite = 1;
					ALUsrc = 0;
					ALUop = 5'b00100;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
			
			6'b000110: //div
				begin
					RegDest = 0;
					RegWrite = 0;
					ALUsrc = 0;
					ALUop = 5'b00101;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b000111: //mfhi
				begin
					RegDest = 1;
					RegWrite = 1;
					ALUsrc = 0;
					ALUop = 5'b01101;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
			
			6'b001000: //mflo
				begin
					RegDest = 1;
					RegWrite = 1;
					ALUsrc = 0;
					ALUop = 5'b01110;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
			
			6'b001001: //sll
				begin
					RegDest = 1;
					RegWrite = 1;
					ALUsrc = 0;
					ALUop = 5'b00110;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
			
			6'b001010: //srl
				begin
					RegDest = 1;
					RegWrite = 1;
					ALUsrc = 0;
					ALUop = 5'b00111;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
			
			6'b001011: //slt
				begin
					RegDest = 1;
					RegWrite = 1;
					ALUsrc = 0;
					ALUop = 5'b01100;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b001100: //jr
				begin
					RegDest = 0;
					RegWrite = 0;
					ALUsrc = 0;
					ALUop = 5'b11111;
					JumpReg = 1;
					Branch = 0;
					Jump = 1;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			//TIPO J
			6'b001101: //j
				begin
					RegDest = 0;
					RegWrite = 0;
					ALUsrc = 0;
					ALUop = 5'b11111;
					JumpReg = 0;
					Branch = 0;
					Jump = 1;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
			
			6'b001110: //jal
				begin
					RegDest = 0;
					RegWrite = 1;
					ALUsrc = 0;
					ALUop = 5'b11111;
					JumpReg = 0;
					Branch = 0;
					Jump = 1;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 1;
				end
			
			
			//TIPO I
			6'b001111: //beq
				begin
					RegDest = 0;
					RegWrite = 0;
					ALUsrc = 0;
					ALUop = 5'b001010;
					JumpReg = 0;
					Branch = 1;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b010000: //bne
				begin
					RegDest = 0;
					RegWrite = 0;
					ALUsrc = 0;
					ALUop = 5'b01011;
					JumpReg = 0;
					Branch = 1;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b010001: //bgt
				begin
					RegDest = 0;
					RegWrite = 0;
					ALUsrc = 0;
					ALUop = 5'b01000;
					JumpReg = 0;
					Branch = 1;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b010010: //blt
				begin
					RegDest = 0;
					RegWrite = 0;
					ALUsrc = 0;
					ALUop = 5'b01001;
					JumpReg = 0;
					Branch = 1;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b010011: //bge
				begin
					RegDest = 0;
					RegWrite = 0;
					ALUsrc = 0;
					ALUop = 5'b01111;
					JumpReg = 0;
					Branch = 1;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b010100: //ble
				begin
					RegDest = 0;
					RegWrite = 0;
					ALUsrc = 0;
					ALUop = 5'b10000;
					JumpReg = 0;
					Branch = 1;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b010101: //addi
				begin
					RegDest = 0;
					RegWrite = 1;
					ALUsrc = 1;
					ALUop = 5'b00010;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b010110: //sw
				begin
					RegDest = 0;
					RegWrite = 0;
					ALUsrc = 1;
					ALUop = 5'b00010;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 1;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
				
			6'b010111: //lw
				begin
					RegDest = 0;
					RegWrite = 1;
					ALUsrc = 1;
					ALUop = 5'b00010;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 1;
					MemtoReg = 1;
					JAL = 0;
				end
			
			default:
				begin
					RegDest = 0;
					RegWrite = 0;
					ALUsrc = 0;
					ALUop = 5'b11111;
					JumpReg = 0;
					Branch = 0;
					Jump = 0;
					Stop = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					JAL = 0;
				end
		endcase
	end
endmodule
