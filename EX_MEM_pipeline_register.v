`timescale 1ns / 1ps

module EX_MEM_pipeline_register(
	input RegWrite, input MemToReg, input Branch, input MemRead, input MemWrite, input[31:0] add_result, input[31:0] read_data_2, input Zero, input[31:0] ALU_result, input[4:0]  write_register_index, input hit, input clock,
	output reg RegWrite_output, output reg MemToReg_output, output reg Branch_output, output reg MemRead_output, output reg MemWrite_output, output reg[31:0] add_result_output, output reg[31:0] read_data_2_output, output reg Zero_output, output reg[31:0] ALU_result_output, output reg[4:0] write_register_index_output
	);
	
	always@(negedge clock) 
		if(hit) 
			begin 
				RegWrite_output = RegWrite;
				MemToReg_output = MemToReg;
				Branch_output = Branch;
				MemRead_output = MemRead;
				MemWrite_output = MemWrite;
				add_result_output = add_result;
				read_data_2_output = read_data_2;
				Zero_output = Zero;
				ALU_result_output = ALU_result;
				write_register_index_output = write_register_index;
			end

endmodule
