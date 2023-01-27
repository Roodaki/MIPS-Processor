`timescale 1ns / 1ps

module ID_EX_pipeline_register_test;

	// Inputs
	reg clock;
	reg hit;
	reg [31:0] read_data_1;
	reg [31:0] read_data_2;
	reg [31:0] sign_extended_immediate;
	reg RegDst;
	reg ALUSrc;
	reg MemtoReg;
	reg RegWrite;
	reg MemRead;
	reg MemWrite;
	reg Branch;
	reg [2:0] ALUOp;
	reg [4:0] rt;
	reg [4:0] rd;
	reg [5:0] funct;
	reg [31:0] next_PC;

	// Outputs
	wire [31:0] read_data_1_output;
	wire [31:0] read_data_2_output;
	wire [31:0] sign_extended_immediate_output;
	wire RegDst_output;
	wire ALUSrc_output;
	wire MemtoReg_output;
	wire RegWrite_output;
	wire MemRead_output;
	wire MemWrite_output;
	wire Branch_output;
	wire [2:0] ALUOp_output;
	wire [4:0] rt_output;
	wire [4:0] rd_output;
	wire [5:0] funct_output;
	wire [31:0] next_PC_output;

	// Instantiate the Unit Under Test (UUT)
	ID_EX_pipeline_register uut (
		.clock(clock), 
		.hit(hit), 
		.read_data_1(read_data_1), 
		.read_data_2(read_data_2), 
		.sign_extended_immediate(sign_extended_immediate), 
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.ALUOp(ALUOp), 
		.rt(rt), 
		.rd(rd), 
		.funct(funct), 
		.next_PC(next_PC), 
		.read_data_1_output(read_data_1_output), 
		.read_data_2_output(read_data_2_output), 
		.sign_extended_immediate_output(sign_extended_immediate_output), 
		.RegDst_output(RegDst_output), 
		.ALUSrc_output(ALUSrc_output), 
		.MemtoReg_output(MemtoReg_output), 
		.RegWrite_output(RegWrite_output), 
		.MemRead_output(MemRead_output), 
		.MemWrite_output(MemWrite_output), 
		.Branch_output(Branch_output), 
		.ALUOp_output(ALUOp_output), 
		.rt_output(rt_output), 
		.rd_output(rd_output), 
		.funct_output(funct_output), 
		.next_PC_output(next_PC_output)
		);

	initial
		begin
			clock = 0;
			hit = 1;
			read_data_1 = 111;
			read_data_2 = 222;
			sign_extended_immediate = 333;
			RegDst = 0;
			ALUSrc = 0;
			MemtoReg = 0;
			RegWrite = 0;
			MemRead = 0;
			MemWrite = 0;
			Branch = 0;
			ALUOp = 0;
			rt = 4;
			rd = 5;
			funct = 6;
			next_PC = 777;
		end
      
endmodule
