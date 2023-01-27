`timescale 1ns / 1ps

module ALU(
	input [31:0] input1, input [31:0] input2, input [3:0] ALUCnt, input [4:0] shamt, 
	output [31:0] ALU_result, output Zero
	); 

	 assign ALU_result = ALUCnt==4'b0000 ? input1 + input2 :
						  ALUCnt==4'b0001 ? input1 - input2 :
						  ALUCnt==4'b0010 ? ~input1 :
						  ALUCnt==4'b0011 ? input1 << shamt :
						  ALUCnt==4'b0100 ? input1 >> shamt :
						  ALUCnt==4'b0101 ? input1 & input2 :
						  ALUCnt==4'b0110 ? input1 | input2 :
						  ALUCnt==4'b0111 ? input1 < input2 ? 1 : 0 : 
																				  32'bX;
																				  
	assign Zero = ALU_result==0 ? 1 : 0;
	
endmodule
