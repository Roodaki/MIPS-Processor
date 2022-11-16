`timescale 1ns / 1ps

module register_file_test;

	// Inputs
	reg [4:0] read_register_index_1;
	reg [4:0] read_register_index_2;
	reg [4:0] write_register_index;
	reg [31:0] write_data;
	reg write_signal;
	reg clock;

	// Outputs
	wire [31:0] read_data_1;
	wire [31:0] read_data_2;

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.read_register_index_1(read_register_index_1), 
		.read_register_index_2(read_register_index_2), 
		.write_register_index(write_register_index), 
		.write_data(write_data), 
		.write_signal(write_signal), 
		.clock(clock), 
		.read_data_1(read_data_1), 
		.read_data_2(read_data_2)
	);

	initial
		begin
			clock = 0;
				
			read_register_index_1 = 1;
			read_register_index_2 = 2;
			write_register_index = 0;
			write_data = 333;
			write_signal = 1;
			#100
			read_register_index_1 = 1;
			read_register_index_2 = 2;
			write_register_index = 3;
			write_data = 333;
			write_signal = 0;
			#100
			read_register_index_1 = 1;
			read_register_index_2 = 2;
			write_register_index = 3;
			write_data = 333;
			write_signal = 1;
			#100
			read_register_index_1 = 3;
			read_register_index_2 = 2;
			write_register_index = 3;
			write_data = 333;
			write_signal = 0;
		end

	always #50 clock = ~clock;
      
endmodule
