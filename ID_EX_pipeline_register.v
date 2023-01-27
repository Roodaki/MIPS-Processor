`timescale 1ns / 1ps

module ID_EX_pipeline_register(
	input RegDst, input ALUSrc, input MemtoReg, input RegWrite, input MemRead, input MemWrite, input Branch,	input[2:0] ALUOp, input[31:0] next_PC, input hit, input [31:0] read_data_1, input [31:0] read_data_2, input [31:0] sign_extended_immediate, input[5:0] funct, input[4:0] rt,	input[4:0] rd, input clock,
	output reg RegDst_output, output reg ALUSrc_output, output reg MemtoReg_output, output reg RegWrite_output, output reg MemRead_output,	output reg MemWrite_output, output reg Branch_output,	output reg[2:0] ALUOp_output, output reg[31:0] next_PC_output, output reg [31:0] read_data_1_output, output reg [31:0] read_data_2_output, output reg [31:0] sign_extended_immediate_output,	output reg[5:0] funct_output,	output reg[4:0] rt_output, output reg[4:0] rd_output
	);
	
	always@(negedge clock)
		if(hit)
			begin
				RegDst_output = RegDst;
				ALUSrc_output = ALUSrc;
				MemtoReg_output = MemtoReg;
				RegWrite_output = RegWrite;
				MemRead_output = MemRead;
				MemWrite_output = MemWrite; 
				Branch_output = Branch;
				ALUOp_output = ALUOp;
				next_PC_output = next_PC;
				read_data_1_output = read_data_1;
				read_data_2_output = read_data_2;
				sign_extended_immediate_output = sign_extended_immediate;
				funct_output = funct;
				rt_output = rt;
				rd_output = rd;
			end

endmodule
