module ULA(ALUop, clock, op1, op2, Resultado, Zero, Hi, Lo, Desloc);
input [4:0] ALUop;
input clock;
input [31:0] op1, op2;
input [4:0] Desloc;
output reg [31:0] Resultado, Hi, Lo;
output reg Zero;

always @ (posedge clock) 
	begin 
		case (ALUop)
			5'b00000: Resultado = op1 & op2; //and
			5'b00001: Resultado = op1 | op2; //or
			5'b00010: Resultado = op1 + op2; //add
			5'b00011: Resultado = op1 - op2; //sub
			5'b00100: //mult
				begin
					{Hi, Lo} = op1 * op2; 
					Resultado = op1 * op2;
				end
			5'b00101:  //div
				begin
					Hi = op1 % op2;
					Lo = op1 / op2;
				end
			5'b00110: Resultado = op1 << Desloc; //sll
			5'b00111: Resultado = op1 >> Desloc; //srl
			5'b01000: //bgt
				begin
					if (op1 > op2)
						begin
							Zero = 1'b1;
						end
					else
						begin
							Zero = 1'b0;
						end	
				end
			5'b01001: //blt
				begin
					if (op1 < op2)
						begin
							Zero = 1'b1;
						end
					else
						begin
							Zero = 1'b0;
						end	
				end
			5'b01010: //beq
				begin
					if (op1 == op2)
						begin
							Zero = 1'b1;
						end
					else
						begin
							Zero = 1'b0;
						end	
				end
			5'b01011: //bne
				begin
					if (op1 != op2)
						begin
							Zero = 1'b1;
						end
					else
						begin
							Zero = 1'b0;
						end	
				end	
			5'b01100: //slt
				begin
					if (op1 < op2)
						begin
							Resultado = 32'b00000000000000000000000000000001;
						end
					else
						begin
							Resultado = 32'b00000000000000000000000000000000;
						end
				end
			5'b01101: Resultado = Hi; //mfhi
			
			5'b01110: Resultado = Lo; //mflo
			
			5'b01111: //bge
				begin
					if (op1 >= op2)
						begin
							Zero = 1'b1;
						end
					else
						begin
							Zero = 1'b0;
						end	
				end
			
			5'b10000: //ble
				begin
					if (op1 <= op2)
						begin
							Zero = 1'b1;
						end
					else
						begin
							Zero = 1'b0;
						end	
				end
				
			default: Resultado = 32'b0;
			
		endcase
	end

endmodule
