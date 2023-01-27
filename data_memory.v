`timescale 1ns / 1ps

module data_memory(
	input clock, input [31:0] address, input [31:0] write_data, input MemWrite, input MemRead, 
	output reg [31:0] read_data
	);
	
	reg [7:0] data_memory [1023:0];
	integer i;
	
	initial
		for(i=0; i<=1023; i=i+1)
			data_memory[i] = i;
	
	always@(posedge clock)
		begin
			if(MemRead)
				begin
					read_data[7:0] = data_memory[address];
					read_data[15:8] = data_memory[address+1];
					read_data[23:16] = data_memory[address+2];
					read_data[31:24] = data_memory[address+3];
				end
			if(MemWrite) 
				begin
					data_memory[address] = write_data[7:0];
					data_memory[address+1] = write_data[15:8];
					data_memory[address+2] = write_data[23:16];
					data_memory[address+3] = write_data[31:24];
				end	
		end

endmodule
