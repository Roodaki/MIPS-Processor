`timescale 1ns / 1ps

module adder(
	input[31:0] input1, input[31:0] input2, 
	output[31:0] add_result
	);

	assign add_result = input1 + input2;
	
endmodule
