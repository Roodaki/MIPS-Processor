`timescale 1ns / 1ps

// One of the 32 Registers of the MIPS Architecture Which Indicates the Executing Line of the Instruction Memory.
module PC_register(input[31:0] next_instruction_address, input clock, output reg[31:0] instruction_address);
	always @(posedge clock)
		instruction_address = next_instruction_address;
endmodule
