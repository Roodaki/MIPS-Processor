`timescale 1ns / 1ps

module PC_register_test;

	// Inputs
	reg [31:0] next_instruction_address;
	reg clock;
	reg hit;

	// Outputs
	wire [31:0] instruction_address;

	// Instantiate the Unit Under Test (UUT)
	PC_register uut (
		.next_instruction_address(next_instruction_address), 
		.clock(clock), 
		.hit(hit), 
		.instruction_address(instruction_address)
	);

	initial
		begin
			next_instruction_address = 111;
			clock = 0;
			hit = 0;
			#100;
			clock = 1;
			#100;
			clock = 0;
			#100
			clock = 1;
			hit = 1;
			#100
			clock = 0;
			#100;
			next_instruction_address = 222;
			clock = 1;
			#100;
			clock = 0;
			#100;
		end
		
endmodule
