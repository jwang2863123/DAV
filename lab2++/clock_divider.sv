module clock_divider #(BASE_SPEED = 50000000)(input clk, input [19:0] speed, output reg outClk);

	reg outClk_d = 0;
	reg [19:0] counter_d = 0;
	reg [19:0] counter = 0;
	always_comb begin
		
		
		/*	if(reset == 0) begin
				outClk_d = 0;
			end else begin
				outClk_d = 1;
			end*/
			if(counter < ((BASE_SPEED / speed) / 2)) begin
				outClk_d = 0;
			end else begin
				outClk_d = 1;
			end
			if(/*(reset == 0) ||*/ counter == ((BASE_SPEED / speed) - 1)) begin
				counter_d = 0;
			end else begin
				counter_d = counter + 1;				
			end
	end
	
	always@ (posedge clk) begin
		counter <= counter_d;
		outClk <= outClk_d;
	end
endmodule