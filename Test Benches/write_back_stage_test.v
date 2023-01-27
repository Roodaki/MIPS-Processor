`timescale 1ns / 1ps

module write_back_stage_test;

	// Inputs
	reg MemToReg;
	reg [31:0] ALU_result;
	reg [31:0] data_memory_read_data;

	// Outputs
	wire [31:0] write_data;

	// Instantiate the Unit Under Test (UUT)
	write_back_stage uut (
		.MemToReg(MemToReg), 
		.ALU_result(ALU_result), 
		.data_memory_read_data(data_memory_read_data), 
		.write_data(write_data)
	);

	initial
		begin
			MemToReg = 0;
			ALU_result = 111;
			data_memory_read_data = 222;
		end
      
endmodule
