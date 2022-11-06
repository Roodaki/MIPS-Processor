`timescale 1ns / 1ps

module instruction_memory_test;

	// Inputs
	reg [31:0] address;
	reg clock;

	// Outputs
	wire [127:0] data_line;

	// Instantiate the Unit Under Test (UUT)
	instruction_memory uut (
		.address(address), 
		.clock(clock), 
		.data_line(data_line)
	);

	initial 
	begin
		address = 20;
		
		clock = 0;
		#100;
		clock = 1;
		#100;
		clock = 0;
		#100;
		clock = 1;
		#100;
		clock = 0;
		#100;
		clock = 1;
		#100;
		clock = 0;;
		#100;
		clock = 1;
		#100;
		clock = 0;
		#100;
		clock = 1;
		#100;
		clock = 0;
		#100;
	end
      
endmodule

