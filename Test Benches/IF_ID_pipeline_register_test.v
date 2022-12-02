`timescale 1ns / 1ps

module IF_ID_pipeline_register_test;

	// Inputs
	reg [31:0] instruction;
	reg [31:0] next_PC;
	reg hit;
	reg clock;

	// Outputs
	wire [31:0] instruction_output;
	wire [31:0] next_PC_output;

	// Instantiate the Unit Under Test (UUT)
	IF_ID_pipeline_register uut (
		.instruction(instruction), 
		.next_PC(next_PC), 
		.hit(hit), 
		.clock(clock), 
		.instruction_output(instruction_output), 
		.next_PC_output(next_PC_output)
	);

	initial
		begin
			clock = 1;
			
			hit = 1;
			instruction = 32'b1;
			next_PC = 32'b0;
			#300
			instruction = 32'b0;
			next_PC = 32'b1;
		end
	
	always #200 clock = ~clock;
      
endmodule
