`timescale 1ns / 1ps

module decode_stage_test;

	// Inputs
	reg [31:0] fetched_instruction;
	reg clock;

	// Outputs
	wire [5:0] opcode;
	wire [31:0] read_data_1;
	wire [31:0] read_data_2;
	wire [31:0] sign_extended_immediate;
	wire [4:0] rt;
	wire [4:0] rd;

	// Instantiate the Unit Under Test (UUT)
	decode_stage uut (
		.fetched_instruction(fetched_instruction), 
		.clock(clock), 
		.opcode(opcode), 
		.read_data_1(read_data_1), 
		.read_data_2(read_data_2), 
		.sign_extended_immediate(sign_extended_immediate), 
		.rt(rt), 
		.rd(rd)
	);

	initial
		begin
			clock = 0;
			fetched_instruction = 999999999;
		end
      
	always #50 clock = ~clock;
		
endmodule

