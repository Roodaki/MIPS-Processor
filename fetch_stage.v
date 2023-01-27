`timescale 1ns / 1ps

module fetch_stage(
	input[31:0] branch_target, input PC_Src, input clock, 
	output reg[31:0] instruction, output[31:0] next_PC, output reg hit
	);
	
	wire[31:0] mux_to_PC;
	wire[31:0] PC_output;
	wire[127:0] InstructionMemory_to_cache;
	wire[31:0] fetched_instruction;
	wire hit_out;
	
	initial hit = 0;
	
	PC_register PC_register_instance(
		.next_instruction_address(mux_to_PC),
		.hit(hit),
		.clock(clock),
		
		.instruction_address(PC_output)
	);
	
	adder adder_instance(
		.input1(PC_output), 
		.input2(4), 
		
		.add_result(next_PC)
	);
	
	instruction_memory instruction_memory_instance(
		.address(PC_output),
		.clock(clock),
		
		.data_line(InstructionMemory_to_cache)
	);
	
	cache cache_instance(
		.address(PC_output),
		.data_line(InstructionMemory_to_cache),
		.clock(clock),
		
		.instruction(fetched_instruction),
		.hit(hit_out)
	);

	assign mux_to_PC = PC_Src!==1 ? next_PC : branch_target;
			
	always@(fetched_instruction) instruction <= fetched_instruction;
	always@(hit_out) hit <= hit_out;
	
endmodule
