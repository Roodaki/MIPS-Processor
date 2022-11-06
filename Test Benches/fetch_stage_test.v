`timescale 1ns / 1ps

module fetch_stage_test;

	// Inputs
	reg [31:0] branch_target;
	reg PC_Src;
	reg clock;

	// Outputs
	wire [31:0] instruction;
	wire [31:0] next_PC;
	wire hit;

	// Instantiate the Unit Under Test (UUT)
	fetch_stage uut (
		.branch_target(branch_target), 
		.PC_Src(PC_Src), 
		.clock(clock), 
		.instruction(instruction), 
		.next_PC(next_PC), 
		.hit(hit)
	);

	initial
		begin
			clock = 0;
			branch_target = 0;
			PC_Src = 1;
			#50
			PC_Src = 0;
		end

	always #25 clock = ~clock;

endmodule

