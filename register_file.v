`timescale 1ns / 1ps

// Register File Consist of 32 32-Bits Register of MIPS Which Takes 3 Indexes and a 32-Bits Data And Will Read the Value 0f 2 Registers with 2 First Indexes And If the write_signal if On, Wite the Inputted Data into the Register With 3rd Index.
module register_file(
	input [4:0] read_register_index_1, input[4:0] read_register_index_2, input[4:0] write_register_index, input[31:0] write_data, input write_signal, input clock, 
	output[31:0] read_data_1, output[31:0] read_data_2
	);

	reg [31:0] register_file[31:0];
	integer i;
	
	// Initial Register's Values To Their Index
	initial
		for(i = 0; i < 32; i = i+1)
			register_file[i] = i;
	
	// Outputting Read Registers' Data
	assign read_data_1 = register_file[read_register_index_1];
	assign  read_data_2 = register_file[read_register_index_2];
	
	// Assigning New Data to Write Register
	always@(posedge clock)
			if(write_signal)
				if(write_register_index !== 0)
						register_file[write_register_index] = write_data;
				else
					$display("Zero Register's Value Cannot Be Changed!");
			else
				$display("Control Unit Doesn't Allow Register Value Change in Write Signal!");
						
endmodule
