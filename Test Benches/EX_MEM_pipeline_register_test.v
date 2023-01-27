`timescale 1ns / 1ps

module EX_MEM_pipeline_register_test;

	// Inputs
	reg RegWrite;
	reg MemToReg;
	reg Branch;
	reg MemRead;
	reg MemWrite;
	reg [31:0] add_result;
	reg [31:0] read_data_2;
	reg Zero;
	reg [31:0] ALU_result;
	reg [4:0] write_register_index;
	reg hit;
	reg clock;

	// Outputs
	wire RegWrite_output;
	wire MemToReg_output;
	wire Branch_output;
	wire MemRead_output;
	wire MemWrite_output;
	wire [31:0] add_result_output;
	wire [31:0] read_data_2_output;
	wire Zero_output;
	wire [31:0] ALU_result_output;
	wire [4:0] write_register_index_output;

	// Instantiate the Unit Under Test (UUT)
	EX_MEM_pipeline_register uut (
		.RegWrite(RegWrite), 
		.MemToReg(MemToReg), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.add_result(add_result), 
		.read_data_2(read_data_2), 
		.Zero(Zero), 
		.ALU_result(ALU_result), 
		.write_register_index(write_register_index), 
		.hit(hit), 
		.clock(clock), 
		.RegWrite_output(RegWrite_output), 
		.MemToReg_output(MemToReg_output), 
		.Branch_output(Branch_output), 
		.MemRead_output(MemRead_output), 
		.MemWrite_output(MemWrite_output), 
		.add_result_output(add_result_output), 
		.read_data_2_output(read_data_2_output), 
		.Zero_output(Zero_output), 
		.ALU_result_output(ALU_result_output), 
		.write_register_index_output(write_register_index_output)
	);

	initial
		begin
			clock = 1;

			RegWrite = 0;
			MemToReg = 0;
			Branch = 0;
			MemRead = 0;
			MemWrite = 0;
			add_result = 111;
			read_data_2 = 222;
			Zero = 0;
			ALU_result = 333;
			write_register_index = 32;
			hit = 1;
			
			clock = 0;
		end
		      
endmodule

