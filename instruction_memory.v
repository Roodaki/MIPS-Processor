`timescale 1ns / 1ps

// A Memory Which Reads A 128-Bits Data Line Consist of Four 32-Bits Assembled Instructions According to the Inputted Address.
module instruction_memory(
	input[31:0] address, input clock,
	output reg[127:0] data_line
	);
	
	reg[2:0] counter;
	reg[7:0] instruction_memory [0:1023];
	reg[27:0] upper_28bits_of_address;
	integer i;
	
	initial
		begin
			counter = 3'b000;
			$readmemh("instruction_memory.txt", instruction_memory);
		end
	
	always @(posedge clock)
		begin
			if (upper_28bits_of_address != address[31:4])
				begin
					counter = 3'b000;
					data_line = 128'bX;
				end
			else if (counter < 3'b100)
				counter = counter + 1;
			else
				begin
					for (i = 0; i < 16; i = i+1)
						data_line = {data_line, instruction_memory[((address >> 4) << 4) + i]};
						
					counter = 3'b000;
				end
			
			upper_28bits_of_address = address[31:4];
		end
	
endmodule
