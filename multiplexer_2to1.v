`timescale 1ns / 1ps

// 2:1 32-Bits Multiplexer Whitch Returns First Input Element if the Selector Line if 0 Or Returns The Second Input Element if the Selector Line is 1.
module multiplexer_2to1(input[31:0] input0, input[31:0] input1, input selector, output[31:0] output0);
	assign output0 = selector ? input1 : input0;
endmodule
