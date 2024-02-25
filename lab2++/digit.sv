module digit(
	input [3:0] switches, input sel, output [7:0] leds
);

	// The following block will contain the logic of your combinational circuit
	always_comb begin
	
		if (sel) begin
			leds = 8'b11111111;
		end
		else begin
			leds[7] = 1;
			case (switches)
			
				4'b0000: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 0;
					leds[5] = 0;
					leds[6] = 1;
				end
				4'b0001: begin
					leds[0] = 1;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 1;
					leds[4] = 1;
					leds[5] = 1;
					leds[6] = 1;
				end
				4'b0010: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 1;
					leds[3] = 0;
					leds[4] = 0;
					leds[5] = 1;
					leds[6] = 0;
				end
				4'b0011: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 1;
					leds[5] = 1;
					leds[6] = 0;
				end
				4'b0100: begin
					leds[0] = 1;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 1;
					leds[4] = 1;
					leds[5] = 0;
					leds[6] = 0;
				end
				4'b0101: begin
					leds[0] = 0;
					leds[1] = 1;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 1;
					leds[5] = 0;
					leds[6] = 0;
				end
				4'b0110: begin
					leds[0] = 0;
					leds[1] = 1;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 0;
					leds[5] = 0;
					leds[6] = 0;
				end
				4'b0111: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 1;
					leds[4] = 1;
					leds[5] = 1;
					leds[6] = 1;
				end
				4'b1000: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 0;
					leds[5] = 0;
					leds[6] = 0;
				end
				4'b1001: begin
					leds[0] = 0;
					leds[1] = 0;
					leds[2] = 0;
					leds[3] = 0;
					leds[4] = 1;
					leds[5] = 0;
					leds[6] = 0;
				end
				
				default: begin // this is the "catch-all" case 
					leds[0] = 1;
					leds[1] = 1;
					leds[2] = 1;
					leds[3] = 1;
					leds[4] = 1;
					leds[5] = 1;
					leds[6] = 0;
				end
				
			endcase
		end
		
	end
endmodule
