module buzz_top(input clock, input reset, output reg outClk);
	clock_divider_top buz(clock, 113636, reset, outClk);
endmodule