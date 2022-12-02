`timescale 1ns / 1ps

module control_unit_test;

	// Inputs
	reg [5:0] opcode;

	// Outputs
	wire RegDst;
	wire ALUSrc;
	wire MemtoReg;
	wire RegWrite;
	wire MemRead;
	wire MemWrite;
	wire Branch;
	wire [2:0] ALUOp;

	// Instantiate the Unit Under Test (UUT)
	control_unit uut (
		.opcode(opcode), 
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.ALUOp(ALUOp)
	);

	initial
		begin
			opcode = 6'b000000;
			#100
			opcode = 6'b000100;
			#100
			opcode = 6'b000101;
			#100
			opcode = 6'b000111;
			#100
			opcode = 6'b000110;
			#100
			opcode = 6'b000001;
		end
      
endmodule
