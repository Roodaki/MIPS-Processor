`timescale 1ns / 1ps

module MEM_WB_Register_test;

	// Inputs
	reg RegWrite;
	reg MemToReg;
	reg [31:0] data_memory_read_data;
	reg [31:0] ALU_result;
	reg [4:0] write_register_index;
	reg hit;
	reg clock;

	// Outputs
	wire RegWrite_output;
	wire MemtoReg_output;
	wire [31:0] data_memory_read_data_output;
	wire [31:0] ALU_result_output;
	wire [4:0] write_register_index_output;

	// Instantiate the Unit Under Test (UUT)
	MEM_WB_pipeline_register uut (
		.RegWrite(RegWrite), 
		.MemToReg(MemToReg), 
		.data_memory_read_data(data_memory_read_data), 
		.ALU_result(ALU_result), 
		.write_register_index(write_register_index), 
		.hit(hit), 
		.clock(clock), 
		.RegWrite_output(RegWrite_output), 
		.MemtoReg_output(MemtoReg_output), 
		.data_memory_read_data_output(data_memory_read_data_output), 
		.ALU_result_output(ALU_result_output), 
		.write_register_index_output(write_register_index_output)
	);

	initial
		begin
			clock = 1;
			
			RegWrite = 1;
			MemToReg = 1;
			data_memory_read_data = 111;
			ALU_result = 222;
			write_register_index = 32;
			hit = 1;
			
			clock = 0;
		end
      
endmodule

