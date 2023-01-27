`timescale 1ns / 1ps

module ALU_test;

	// Inputs
	reg [31:0] input1;
	reg [31:0] input2;
	reg [3:0] ALUCnt;
	reg [4:0] shamt;

	// Outputs
	wire [31:0] ALU_result;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.input1(input1), 
		.input2(input2), 
		.ALUCnt(ALUCnt), 
		.shamt(shamt), 
		.ALU_result(ALU_result), 
		.Zero(Zero)
	);

	initial
		begin
			input1 = 3;
			input2 = 3;
			
			shamt = 1;
			
			ALUCnt = 0;
			#50
			ALUCnt = 1;
			#50
			ALUCnt = 2;
			#50
			ALUCnt = 3;
			#50
			ALUCnt = 4;
			#50
			ALUCnt = 5;
			#50
			ALUCnt = 6;
			#50
			ALUCnt = 7;
		end
      
endmodule
