`timescale 1ns / 1ps

module ALU_control_test;

	// Inputs
	reg [2:0] ALUOp;
	reg [5:0] funct;

	// Outputs
	wire [3:0] ALUCnt;

	// Instantiate the Unit Under Test (UUT)
	ALU_control uut (
		.ALUOp(ALUOp), 
		.funct(funct), 
		.ALUCnt(ALUCnt)
	);

	initial
		begin
			ALUOp = 1;
			#50
			ALUOp = 2;
			#50			
			ALUOp = 3;
			#50
			ALUOp = 0;
			funct = 0;
			#50
			funct = 1;
			#50
			funct = 2;
			#50
			funct = 3;
			#50
			funct = 4;
			#50
			funct = 5;
			#50
			funct = 6;
			#50
			funct = 7;
		end
      
endmodule
