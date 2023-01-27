`timescale 1ns / 1ps

// One of the 32 Registers of the MIPS Architecture Which Indicates the Executing Line of the Instruction Memory.

module PC_register(
	input[31:0] next_instruction_address, input hit, input clock, 
	output reg[31:0] instruction_address
	);
	
	initial instruction_address = 0;
	
	always @(negedge clock)
		if(hit)
			#0.001 instruction_address = next_instruction_address;
			
endmodule
