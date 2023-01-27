`timescale 1ns / 1ps

module execute_stage_test;

	// Inputs
	reg RegDst;
	reg ALUSrc;
	reg [2:0] ALUOp;
	reg [31:0] next_PC;
	reg [31:0] ALU_read_data_1;
	reg [31:0] ALU_read_data_2;
	reg [31:0] sign_extended_immediate;
	reg [31:0] rt;
	reg [31:0] rd;
	reg [5:0] funct;
	reg clock;

	// Outputs
	wire [31:0] add_result;
	wire [31:0] ALU_result;
	wire Zero;
	wire [31:0] read_data_2;
	wire [4:0] write_register_index;

	// Instantiate the Unit Under Test (UUT)
	execute_stage uut (
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.ALUOp(ALUOp), 
		.next_PC(next_PC), 
		.ALU_read_data_1(ALU_read_data_1), 
		.ALU_read_data_2(ALU_read_data_2), 
		.sign_extended_immediate(sign_extended_immediate), 
		.rt(rt), 
		.rd(rd), 
		.funct(funct), 
		.clock(clock), 
		.add_result(add_result), 
		.ALU_result(ALU_result), 
		.Zero(Zero), 
		.read_data_2(read_data_2),
		.write_register_index(write_register_index)
	);

	initial
		begin
			RegDst = 0;
			ALUSrc = 0;
			ALUOp = 0;
			next_PC = 111;
			ALU_read_data_1 = 222;
			ALU_read_data_2 = 333;
			sign_extended_immediate = 1;
			rt = 10;
			rd = 20;
			funct = 0;
			clock = 0;
		end
      
endmodule

