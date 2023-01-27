`timescale 1ns / 1ps

module control_unit(
	input[5:0] opcode, 
	output RegDst, output ALUSrc, output MemtoReg, output RegWrite, output MemRead, output MemWrite, output Branch, output[2:0] ALUOp
	);
			
	assign RegDst = opcode==6'b000000 ? 1 : 0;
	assign ALUSrc = opcode==6'b000000 || opcode==6'b000110 ? 0 : 1;
	assign MemtoReg = opcode==6'b000100 ? 1 : 0;
	assign RegWrite = opcode==6'b000101 || opcode==6'b000110 ? 0 : 1;
	assign MemRead = opcode==6'b000100 ? 1 : 0;
	assign MemWrite = opcode==6'b000101 ? 1 : 0;
	assign Branch = opcode==6'b000110 ? 1 : 0;
	assign ALUOp = opcode==6'b000100 || opcode==6'b000101 || opcode==6'b000111 ? 3'b011 : opcode==6'b000000 ? 3'b000 : opcode==6'b000110 ? 3'b001 : 3'b010;

endmodule
