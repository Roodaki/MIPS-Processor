`timescale 1ns / 1ps

module adder_test;

	// Inputs
	reg [31:0] input1;
	reg [31:0] input2;

	// Outputs
	wire [31:0] add_result;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.input1(input1), 
		.input2(input2), 
		.add_result(add_result)
	);

	initial
		begin
			input1 = 111;
			input2 = 222;
		end
      
endmodule

