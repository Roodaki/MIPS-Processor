`timescale 1ns / 1ps

module MIPS_main(
	input reg clock
	);
	
	wire[31:0] instruction___from___fetch_stage___to___IF_ID_pipeline_register;
	wire[31:0] next_PC___from___fetch_stage___to___IF_ID_pipeline_register;
	wire[31:0] instruction___from___IF_ID_pipeline_register___to___decode_stage;
	wire hit___from___fetch_stage___to___all_pipeline_registers;
	wire[31:0] next_PC___from___IF_ID_pipeline_register___to___ID_EX_pipeline_register;
	wire[5:0] opcode___from___decode_stage___to___control_unit;
	wire[31:0] read_data_1___from___decode_stage___to___ID_EX_pipeline_register;
	wire[31:0] read_data_2___from___decode_stage___to___ID_EX_pipeline_register;
	wire[31:0] sign_extended_immediate___from___decode_stage___to___ID_EX_pipeline_register;
	wire[4:0] rt___from___decode_stage___to___ID_EX_pipeline_register;
	wire[4:0] rd___from___decode_stage___to___ID_EX_pipeline_register;
	wire RegDst___from___control_unit___to___ID_EX_pipeline_register;
	wire ALUSrc___from___control_unit___to___ID_EX_pipeline_register;
	wire MemtoReg___from___control_unit___to___ID_EX_pipeline_register;
	wire RegWrite___from___control_unit___to___ID_EX_pipeline_register;
	wire MemRead___from___control_unit___to___ID_EX_pipeline_register;
	wire MemWrite___from___control_unit___to___ID_EX_pipeline_register;
	wire Branch___from___control_unit___to___ID_EX_pipeline_register;
	wire[2:0] ALUOp___from___control_unit___to___ID_EX_pipeline_register;
	wire RegDst___from___ID_EX_pipeline_register___to___execute_stage;
	wire ALUSrc___from___ID_EX_pipeline_register___to___execute_stage;
	wire[2:0] ALUOp___from___ID_EX_pipeline_register___to___execute_stage;
	wire[31:0] next_PC___from___ID_EX_pipeline_register___to___execute_stage;
	wire[31:0] read_data_1___from___ID_EX_pipeline_register___to___execute_stage;
	wire[31:0] read_data_2___from___ID_EX_pipeline_register___to___execute_stage;
	wire[31:0] sign_extended_immediate___from___ID_EX_pipeline_register___to___execute_stage;
	wire[5:0] funct___from___ID_EX_pipeline_register___to___execute_stage;
	wire[4:0] rt___from___ID_EX_pipeline_register___to___execute_stage;
	wire[4:0] rd___from___ID_EX_pipeline_register___to___execute_stage;
	wire MemtoReg___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register;
	wire RegWrite___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register;
	wire MemRead___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register;
	wire MemWrite___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register;
	wire Branch___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register;
	wire[31:0] add_result___from___execute_stage___to___EX_MEM_pipeline_register;
	wire[31:0] ALU_result___from___execute_stage___to___EX_MEM_pipeline_register;
	wire[4:0] write_register_index___from___execute_stage___to___EX_MEM_pipeline_register;
	wire Zero___from___execute_stage___to___EX_MEM_pipeline_register;
	wire[31:0] read_data_2___from___execute_stage___to___EX_MEM_pipeline_register;
	wire PC_Src_wire;
	wire Branch___from___EX_MEM_pipeline_register___to___AND_gate;
	wire Zero___from___EX_MEM_pipeline_register___to___AND_gate;
	wire[31:0] branch_target_wire;
	wire RegWrite___from___EX_MEM_pipeline_register___to___MEM_WB_pipeline_register;
	wire MemToReg___from___EX_MEM_pipeline_register___to___MEM_WB_pipeline_register;
	wire MemRead___from___EX_MEM_pipeline_register___to___data_memory;
	wire MemWrite___from___EX_MEM_pipeline_register___to___data_memory;
	wire[31:0] ALU_result___from___EX_MEM_pipeline_register___to___data_memory;
	wire[31:0] read_data_2___from___EX_MEM_pipeline_register___to___data_memory;
	wire[4:0] write_register_index___from___EX_MEM_pipeline_register___to___MEM_WB_pipeline_register;
	wire[31:0] read_data___from___data_memory___to___MEM_WB_pipeline_register;
	wire RegWrite___from___MEM_WB_pipeline_register___to___decode_stage;
	wire MemtoReg___from___MEM_WB_pipeline_register___to___write_back_stage;
	wire[31:0] data_memory_read_data___from___MEM_WB_pipeline_register___to___write_back_stage;
	wire[31:0] ALU_result___from___MEM_WB_pipeline_register___to___write_back_stage;
	wire[31:0] write_data___from___write_back_stage___to___decode_stage;
	wire[4:0] write_register_index___from___MEM_WB_pipeline_register___to___decode_stage;

	fetch_stage fetch_stage_instance(
		//inputs
		.branch_target(branch_target_wire),
		.PC_Src(PC_Src_wire),
		.clock(clock),
		//outputs
		.instruction(instruction___from___fetch_stage___to___IF_ID_pipeline_register),
		.next_PC(next_PC___from___fetch_stage___to___IF_ID_pipeline_register),
		.hit(hit___from___fetch_stage___to___all_pipeline_registers)
	);
		
	IF_ID_pipeline_register IF_ID_pipeline_register_instance(
		//inputs
		.instruction(instruction___from___fetch_stage___to___IF_ID_pipeline_register),
		.next_PC(next_PC___from___fetch_stage___to___IF_ID_pipeline_register),
		.hit(hit___from___fetch_stage___to___all_pipeline_registers),
		.clock(clock),
		//outputs
		.instruction_output(instruction___from___IF_ID_pipeline_register___to___decode_stage),
		.next_PC_output(next_PC___from___IF_ID_pipeline_register___to___ID_EX_pipeline_register)
	);
	
	decode_stage decode_stage_instance(
		//inputs
		.fetched_instruction(instruction___from___IF_ID_pipeline_register___to___decode_stage),
		.write_data(write_data___from___write_back_stage___to___decode_stage),
		.write_register_index(write_register_index___from___MEM_WB_pipeline_register___to___decode_stage),
		.RegWrite(RegWrite___from___MEM_WB_pipeline_register___to___decode_stage),
		.clock(clock),
		//outputs
		.opcode(opcode___from___decode_stage___to___control_unit),
		.read_data_1(read_data_1___from___decode_stage___to___ID_EX_pipeline_register),
		.read_data_2(read_data_2___from___decode_stage___to___ID_EX_pipeline_register),
		.sign_extended_immediate(sign_extended_immediate___from___decode_stage___to___ID_EX_pipeline_register),
		.rt(rt___from___decode_stage___to___ID_EX_pipeline_register),
		.rd(rd___from___decode_stage___to___ID_EX_pipeline_register)
	);
	
	control_unit control_unit_instance(
		//inputs
		.opcode(opcode___from___decode_stage___to___control_unit),
		//outputs
		.RegDst(RegDst___from___control_unit___to___ID_EX_pipeline_register),
		.ALUSrc(ALUSrc___from___control_unit___to___ID_EX_pipeline_register),
		.MemtoReg(MemtoReg___from___control_unit___to___ID_EX_pipeline_register),
		.RegWrite(RegWrite___from___control_unit___to___ID_EX_pipeline_register),
		.MemRead(MemRead___from___control_unit___to___ID_EX_pipeline_register),
		.MemWrite(MemWrite___from___control_unit___to___ID_EX_pipeline_register),
		.Branch(Branch___from___control_unit___to___ID_EX_pipeline_register),
		.ALUOp(ALUOp___from___control_unit___to___ID_EX_pipeline_register)
	);
				
	ID_EX_pipeline_register ID_EX_pipeline_register(
		//inputs
		.RegDst(RegDst___from___control_unit___to___ID_EX_pipeline_register),
		.ALUSrc(ALUSrc___from___control_unit___to___ID_EX_pipeline_register), 
		.MemtoReg(MemtoReg___from___control_unit___to___ID_EX_pipeline_register), 
		.RegWrite(RegWrite___from___control_unit___to___ID_EX_pipeline_register),
		.MemRead(MemRead___from___control_unit___to___ID_EX_pipeline_register), 
		.MemWrite(MemWrite___from___control_unit___to___ID_EX_pipeline_register),
		.Branch(Branch___from___control_unit___to___ID_EX_pipeline_register),	
		.ALUOp(ALUOp___from___control_unit___to___ID_EX_pipeline_register), 
		.next_PC(next_PC___from___IF_ID_pipeline_register___to___ID_EX_pipeline_register), 
		.hit(hit___from___fetch_stage___to___all_pipeline_registers), 
		.read_data_1(read_data_1___from___decode_stage___to___ID_EX_pipeline_register), 
		.read_data_2(read_data_2___from___decode_stage___to___ID_EX_pipeline_register), 
		.sign_extended_immediate(sign_extended_immediate___from___decode_stage___to___ID_EX_pipeline_register), 
		.funct(instruction___from___IF_ID_pipeline_register___to___decode_stage[5:0]), 
		.rt(rt___from___decode_stage___to___ID_EX_pipeline_register),	
		.rd(rd___from___decode_stage___to___ID_EX_pipeline_register), 
		.clock(clock),
		//outputs
		.RegDst_output(RegDst___from___ID_EX_pipeline_register___to___execute_stage), 
		.ALUSrc_output(ALUSrc___from___ID_EX_pipeline_register___to___execute_stage), 
		.MemtoReg_output(MemtoReg___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register), 
		.RegWrite_output(RegWrite___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register), 
		.MemRead_output(MemRead___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register),	
		.MemWrite_output(MemWrite___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register), 
		.Branch_output(Branch___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register),	
		.ALUOp_output(ALUOp___from___ID_EX_pipeline_register___to___execute_stage), 
		.next_PC_output(next_PC___from___ID_EX_pipeline_register___to___execute_stage), 
		.read_data_1_output(read_data_1___from___ID_EX_pipeline_register___to___execute_stage), 
		.read_data_2_output(read_data_2___from___ID_EX_pipeline_register___to___execute_stage), 
		.sign_extended_immediate_output(sign_extended_immediate___from___ID_EX_pipeline_register___to___execute_stage),	
		.funct_output(funct___from___ID_EX_pipeline_register___to___execute_stage),	
		.rt_output(rt___from___ID_EX_pipeline_register___to___execute_stage), 
		.rd_output(rd___from___ID_EX_pipeline_register___to___execute_stage)
	);
		
	execute_stage execute_stage(
		//inputs
		.RegDst(RegDst___from___ID_EX_pipeline_register___to___execute_stage),
		.ALUSrc(ALUSrc___from___ID_EX_pipeline_register___to___execute_stage),
		.ALUOp(ALUOp___from___ID_EX_pipeline_register___to___execute_stage),
		.next_PC(next_PC___from___ID_EX_pipeline_register___to___execute_stage),
		.ALU_read_data_1(read_data_1___from___ID_EX_pipeline_register___to___execute_stage),
		.ALU_read_data_2(read_data_2___from___ID_EX_pipeline_register___to___execute_stage),
		.sign_extended_immediate(sign_extended_immediate___from___ID_EX_pipeline_register___to___execute_stage),
		.rt(rt___from___ID_EX_pipeline_register___to___execute_stage),
		.rd(rd___from___ID_EX_pipeline_register___to___execute_stage),
		.funct(funct___from___ID_EX_pipeline_register___to___execute_stage),
		.clock(clock),
		//outputs
		.add_result(add_result___from___execute_stage___to___EX_MEM_pipeline_register),
		.ALU_result(ALU_result___from___execute_stage___to___EX_MEM_pipeline_register),
		.Zero(Zero___from___execute_stage___to___EX_MEM_pipeline_register), 
		.read_data_2(read_data_2___from___execute_stage___to___EX_MEM_pipeline_register),
		.write_register_index(write_register_index___from___execute_stage___to___EX_MEM_pipeline_register)
	);
				
	EX_MEM_pipeline_register EX_MEM_pipeline_register(
		//inputs
		.RegWrite(RegWrite___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register), 
		.MemToReg(MemtoReg___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register), 
		.Branch(Branch___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register), 
		.MemRead(MemRead___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register), 
		.MemWrite(MemWrite___from___ID_EX_pipeline_register___to___EX_MEM_pipeline_register), 
		.add_result(add_result___from___execute_stage___to___EX_MEM_pipeline_register), 
		.read_data_2(read_data_2___from___execute_stage___to___EX_MEM_pipeline_register), 
		.Zero(Zero___from___execute_stage___to___EX_MEM_pipeline_register), 
		.ALU_result(ALU_result___from___execute_stage___to___EX_MEM_pipeline_register), 
		.write_register_index(write_register_index___from___execute_stage___to___EX_MEM_pipeline_register), 
		.hit(hit___from___fetch_stage___to___all_pipeline_registers), 
		.clock(clock),
		//outputs
		.RegWrite_output(RegWrite___from___EX_MEM_pipeline_register___to___MEM_WB_pipeline_register), 
		.MemToReg_output(MemToReg___from___EX_MEM_pipeline_register___to___MEM_WB_pipeline_register), 
		.Branch_output(Branch___from___EX_MEM_pipeline_register___to___AND_gate), 
		.MemRead_output(MemRead___from___EX_MEM_pipeline_register___to___data_memory), 
		.MemWrite_output(MemWrite___from___EX_MEM_pipeline_register___to___data_memory), 
		.add_result_output(branch_target_wire), 
		.read_data_2_output(read_data_2___from___EX_MEM_pipeline_register___to___data_memory), 
		.Zero_output(Zero___from___EX_MEM_pipeline_register___to___AND_gate), 
		.ALU_result_output(ALU_result___from___EX_MEM_pipeline_register___to___data_memory), 
		.write_register_index_output(write_register_index___from___EX_MEM_pipeline_register___to___MEM_WB_pipeline_register)
	);
	
	assign PC_Src_wire = Branch___from___EX_MEM_pipeline_register___to___AND_gate && Zero___from___EX_MEM_pipeline_register___to___AND_gate;
		
	data_memory data_memory(
		//inputs
		.clock(clock), 
		.address(ALU_result___from___EX_MEM_pipeline_register___to___data_memory), 
		.write_data(read_data_2___from___EX_MEM_pipeline_register___to___data_memory), 
		.MemWrite(MemWrite___from___EX_MEM_pipeline_register___to___data_memory), 
		.MemRead(MemRead___from___EX_MEM_pipeline_register___to___data_memory), 
		//outputs
		.read_data(read_data___from___data_memory___to___MEM_WB_pipeline_register)
	);
				
	MEM_WB_pipeline_register MEM_WB_pipeline_register(
		//inputs
		.RegWrite(RegWrite___from___EX_MEM_pipeline_register___to___MEM_WB_pipeline_register), 
		.MemToReg(MemToReg___from___EX_MEM_pipeline_register___to___MEM_WB_pipeline_register), 
		.data_memory_read_data(read_data___from___data_memory___to___MEM_WB_pipeline_register), 
		.ALU_result(ALU_result___from___EX_MEM_pipeline_register___to___data_memory), 
		.write_register_index(write_register_index___from___EX_MEM_pipeline_register___to___MEM_WB_pipeline_register), 
		.hit(hit___from___fetch_stage___to___all_pipeline_registers), 
		.clock(clock),
		//outputs
		.RegWrite_output(RegWrite___from___MEM_WB_pipeline_register___to___decode_stage), 
		.MemtoReg_output(MemtoReg___from___MEM_WB_pipeline_register___to___write_back_stage), 
		.data_memory_read_data_output(data_memory_read_data___from___MEM_WB_pipeline_register___to___write_back_stage), 
		.ALU_result_output(ALU_result___from___MEM_WB_pipeline_register___to___write_back_stage), 
		.write_register_index_output(write_register_index___from___MEM_WB_pipeline_register___to___decode_stage)
	);
		
	write_back_stage write_back_stage(
		//inputs
		.MemToReg(MemtoReg___from___MEM_WB_pipeline_register___to___write_back_stage), 
		.ALU_result(ALU_result___from___MEM_WB_pipeline_register___to___write_back_stage), 
		.data_memory_read_data(data_memory_read_data___from___MEM_WB_pipeline_register___to___write_back_stage), 
		//outputs
		.write_data(write_data___from___write_back_stage___to___decode_stage)
	);
	
endmodule
