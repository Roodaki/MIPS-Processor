`timescale 1ns / 1ps

module cache_test;

	// Inputs
	reg [31:0] address;
	reg [127:0] data_line;
	reg clock;

	// Outputs
	wire [31:0] instruction;
	wire hit;

	// Instantiate the Unit Under Test (UUT)
	cache uut (
		.address(address), 
		.data_line(data_line), 
		.clock(clock), 
		.instruction(instruction), 
		.hit(hit)
	);

	initial 
		begin
			address = 0;
			data_line = 128'h000102030405060708090a0b0c0d0e0f;
			
			clock = 0;
			#100
			clock = 1;
			#100
			clock = 0;
			#100
			
			address = 4;
			
			clock = 1;
			#100
			clock = 0;
			#100
			clock = 1;
			#100
			clock = 0;
			#100
			
			address = 20;
			
			clock = 1;
			#100
			clock = 0;
		end
endmodule
