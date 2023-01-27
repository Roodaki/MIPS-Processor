`timescale 1ns / 1ps

module MEM_WB_pipeline_register(
	input RegWrite, input MemToReg, input[31:0] data_memory_read_data, input[31:0] ALU_result, input[4:0] write_register_index, input hit, input clock,
	output reg RegWrite_output, output reg MemtoReg_output, output reg[31:0] data_memory_read_data_output, output reg[31:0] ALU_result_output, output reg[4:0] write_register_index_output
	);
		
	always@(negedge clock)
		if(hit) 
			begin 
				MemtoReg_output = MemToReg;
				RegWrite_output = RegWrite;
				write_register_index_output = write_register_index;
				data_memory_read_data_output = data_memory_read_data;
				ALU_result_output = ALU_result;		
			end

endmodule
