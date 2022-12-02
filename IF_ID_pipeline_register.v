`timescale 1ns / 1ps

module IF_ID_pipeline_register(input[31:0] instruction, input[31:0] next_PC, input hit, input clock, output reg[31:0] instruction_output, output reg[31:0] next_PC_output);
	always@(negedge clock)
		begin
			instruction_output = instruction;
			next_PC_output = next_PC;
		end
endmodule
