`timescale 1ns / 1ps

module cache(
	input[31:0] address, input[127:0] data_line, input clock, 
	output reg[31:0] instruction, output reg hit
	);
		
	reg[153:0]cache[7:0];
	
	integer cache_index, tag, valid_bit, offset;
	integer i;
	
	initial
		for(i = 0; i < 8; i = i+1) // Resetting All Valid Bits
			cache[i][153] = 0;

	always@(data_line) // Inserting New Dataline Into Cache
		if(data_line !== 128'bX)
			begin
				cache_index = address[6:4];
				cache[cache_index] = {1'b1, address[31:7], data_line[127:0]}; // Valid Bit(1 Bit) + Tag(25 Bits) + Dataline(128 Bits)
			end
	
	always@(posedge clock) // Outputting Instruction
		begin
			cache_index = address[6:4];
			tag = cache[cache_index][152:128];
			valid_bit = cache[cache_index][153];
			if(address[31:7]==tag && valid_bit) // Hit Scenario: Tag Matches Corresponding Bits of Inputted Address And Valid Bit is On.
				begin
					hit = 1;
					
					offset = address[3:2];
					case(offset)
						2'b00: instruction = cache[cache_index][127:96];
						2'b01: instruction = cache[cache_index][95:64];
						2'b10: instruction = cache[cache_index][63:32];
						2'b11: instruction = cache[cache_index][31:0];
					endcase
				end
			else // Miss Scenario
				begin
					hit = 0;
					instruction = 32'bX;
				end
		end

endmodule
