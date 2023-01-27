`timescale 1ns / 1ps

module execute_stage(
	input RegDst, input ALUSrc, input[2:0] ALUOp, input[31:0] next_PC, input[31:0] ALU_read_data_1, input[31:0] ALU_read_data_2, input[31:0] sign_extended_immediate, input[4:0] rt, input[4:0] rd, input[5:0] funct, input clock,
	output[31:0] add_result, output[31:0] ALU_result, output Zero, output[31:0] read_data_2 ,output[4:0] write_register_index
	);
	
	wire[31:0] multiplexer_2to1___to___ALU;
	wire[3:0] ALUCnt___from___ALU_control___to___ALU;
	
	adder adder(
		.input1(next_PC),
		.input2(sign_extended_immediate<<2),
		.add_result(add_result)
	);
	
	multiplexer_2to1 multiplexer_2to1_1(
		.input0(ALU_read_data_2), 
		.input1(sign_extended_immediate), 
		.selector(ALUSrc), 
		.output0(multiplexer_2to1___to___ALU)
	);
	
	ALU_control ALU_control (
		.ALUOp(ALUOp), 
		.funct(funct),
		.ALUCnt(ALUCnt___from___ALU_control___to___ALU)
	);
	
	ALU ALU (
		.input1(ALU_read_data_1), 
		.input2(multiplexer_2to1___to___ALU), 
		.ALUCnt(ALUCnt___from___ALU_control___to___ALU), 
		.shamt(sign_extended_immediate[10:6]), 
		.ALU_result(ALU_result), 
		.Zero(Zero)
	);
		
	assign write_register_index = RegDst ? rd : rt;
	assign read_data_2 = ALU_read_data_2;
	
endmodule
