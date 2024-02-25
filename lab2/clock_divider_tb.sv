module clock_divider_tb(output outClk);
	
	clock_divider_top UUT(clk, speed, reset, outClk);
	
	initial begin // we run this block once when execution begins
		clock = 0;    // initialize the clock
		#10000 $stop; // after 10000 time ticks, we end simulation. 
	end
	always begin // always w/ no sensitivity only works in simulation

			#10 clock = ~clock; // we toggle the clock every 10 nanoseconds
	                    // this runs in parallel to the initial
                          // block, so it will stop after 10000
                          // nanoseconds
	end
endmodule
