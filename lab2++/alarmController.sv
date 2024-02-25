module alarmController(input [8:0] timer, input reset, input button, input clk, output [8:0] nextTime);
	
	reg [1:0] reset_sr;
	reg [1:0] button_sr;
	reg [1:0] currentState;
	reg [1:0] nextState; // the next state to be assigned
	reg [8:0] outVal_d;  // the next output value to be assigned

	always @(posedge clk) begin
		
		/* shift the shift register left by 1 and
			store the current button value */
		button_sr <= { button_sr[0], button };
		reset_sr <= { reset_sr[0], reset };

		/* state transition */
		currentState <= nextState;
		

		/* output assignment */
		nextTime <= outVal_d;
	end

	localparam SET = 2'b00;
	localparam RUN = 2'b01;
	localparam PAUSE = 2'b10;
	localparam BEEP = 2'b11;

	always_comb begin
		case (currentState)
			SET: begin
				outVal_d = timer;
				if(button_sr == 2'b10) begin
					nextState = RUN;
					//outval_d = RUN;
				end else begin
					nextState = SET;
				end
			end
			
			RUN: begin
				outVal_d = nextTime - 1;
				if(reset_sr == 2'b10) begin
					nextState = SET;
					//outval_d = SET;
				end else if(button_sr == 2'b10) begin
					nextState = PAUSE;
					//outval_d = PAUSE;
				end else if(nextTime == 0) begin
					nextState = BEEP;
				end else begin
					nextState = currentState;
				end
			end
			
			PAUSE: begin
				outVal_d = nextTime;
				if(reset_sr == 2'b10) begin
					nextState = SET;
					//outval_d = SET;
				end else if(button_sr == 2'b10) begin
					nextState = RUN;
					//outval_d = RUN;
				end else begin
					nextState = currentState;
				end
			end
			
			BEEP: begin
				outVal_d = 0;
				if(reset_sr == 2'b10) begin
					nextState = SET;
					//outval_d = SET;
				end else begin
					nextState = currentState;
				end	
			end
			default: begin
				outVal_d = nextTime;
				nextState = currentState;
			end
		endcase
	end
endmodule

