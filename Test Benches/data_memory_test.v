`timescale 1ns / 1ps

module data_memory_test;

	// Inputs
	reg clock;
	reg [31:0] address;
	reg [31:0] write_data;
	reg MemWrite;
	reg MemRead;

	// Outputs
	wire [31:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.clock(clock), 
		.address(address), 
		.write_data(write_data), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.read_data(read_data)
	);

	initial
		begin
			clock = 1;
			
			address = 0;
			write_data = 10;
			MemWrite = 1;
			MemRead = 0;
		
			#100
			
			address = 0;
			MemWrite = 0;
			MemRead = 1;
		end
		
	always #50 clock = ~clock; 		
      
endmodule
