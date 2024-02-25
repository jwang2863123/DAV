module clock_divider(input clk, input [19:0] speed, input reset, output outClk);
	int BASE_SPEED = 50000000;
	
	int cycle = (BASE_SPEED / speed) - 1;
	int regName_d = 0;
	int counter = 0;
	always_comb begin
		if(reset == 0)
			outClk_d = 0;
		if(counter <= (cycle / 2))
			outClk_d = 0;
		else
			outClk_d = 1;
			
		if(reset == 0 | counter == cycle)
			counter_d = 0;
		else
			counter_d++;
	end
	
	always@ (posedge_clock) begin
		counter = counter_d;
		outClk = outClk_d;
	end
