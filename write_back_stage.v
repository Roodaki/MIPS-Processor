`timescale 1ns / 1ps

module write_back_stage(
	input MemToReg, input[31:0] ALU_result, input[31:0] data_memory_read_data, 
	output[31:0] write_data
	);
		
	multiplexer_2to1 multiplexer_2to1(
		// inputs
		.input0(ALU_result),
		.input1(data_memory_read_data),
		.selector(MemToReg),
		// outputs
		.output0(write_data)
	);
	
endmodule
