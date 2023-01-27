`timescale 1ns / 1ps

module decode_stage(
	input[31:0]fetched_instruction, input[31:0] write_data, input[4:0] write_register_index, input RegWrite, input clock,
	output reg [5:0] opcode,output reg [31:0] read_data_1,output reg [31:0] read_data_2,output reg [31:0] sign_extended_immediate, output reg[4:0] rt, output reg[4:0] rd
	);	
	
	reg[4:0] rs;
	reg[15:0] immediate_value;
	
	wire[31:0] read_data_1_wire;
	wire[31:0] read_data_2_wire;
	wire[31:0] sign_extended_immediate_wire;
	
	always@(posedge clock)
		begin
			opcode = fetched_instruction[31:26];
			rs = fetched_instruction[25:21];
			rt = fetched_instruction[20:16];
			rd = fetched_instruction[15:11];	
			immediate_value = fetched_instruction[15:0];	
		end
	
	register_file register_file_instance(
		// inputs
		.read_register_index_1(rs),
		.read_register_index_2(rt),
		.write_register_index(write_register_index),
		.write_data(write_data),
		.write_signal(RegWrite),
		.clock(clock),
		// outputs
		.read_data_1(read_data_1_wire),
		.read_data_2(read_data_2_wire)
	);
	
	sign_extend sign_extend_instance(
		// inputs
		.value(immediate_value),
		// outputs
		.sign_extended_value(sign_extended_immediate_wire)		
	);
	
	always@(read_data_1_wire) read_data_1 = read_data_1_wire;
	always@(read_data_2_wire) read_data_2 = read_data_2_wire;
	always@(sign_extended_immediate_wire) sign_extended_immediate = sign_extended_immediate_wire;
		
endmodule
