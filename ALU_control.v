`timescale 1ns / 1ps

module ALU_control(
	input [5:0] funct, input [2:0] ALUOp, 
	output [3:0] ALUCnt
	);
	
	assign ALUCnt = ALUOp==3'b001 ? 4'b0001 :
						 ALUOp==3'b010 ? 4'b0111 :
						 ALUOp==3'b011 ? 4'b0000 :
						 ALUOp==3'b000 ? funct==6'b000000 ? 4'b0000 :
											  funct==6'b000001 ? 4'b0001 :
											  funct==6'b000010 ? 4'b0101 :
			  								  funct==6'b000011 ? 4'b0110 :
				  							  funct==6'b000100 ? 4'b0111 :
											  funct==6'b000101 ? 4'b0011 :
											  funct==6'b000110 ? 4'b0100 :
											  funct==6'b000111 ? 4'b0010 : 4'bX
																							: 4'bX;
																							
endmodule
