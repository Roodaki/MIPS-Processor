`timescale 1ns / 1ps

module multiplexer_2to1_test;
	// Inputs
	reg [31:0] input0;
	reg [31:0] input1;
	reg selector;

	// Outputs
	wire [31:0] output0;

	// Instantiate the Unit Under Test (UUT)
	multiplexer_2to1 uut (
		.input0(input0), 
		.input1(input1), 
		.selector(selector), 
		.output0(output0)
	);

	initial
	begin
		input0 = 111;
		input1 = 222;
		selector = 0;
		#500;
		input0 = 111;
		input1 = 222;
		selector = 1;
		#100;
	end
endmodule
