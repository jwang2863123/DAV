module clock_divider_top #(BASE_SPEED = 50000000)(input clk, input [19:0] speed, input reset, output reg outClk);

	reg outClk_d = 0;
	reg [19:0] counter_d = 0;
	reg [19:0] counter = 0;
	always_comb begin
		
		if(reset == 1) begin
			outClk_d = 0;
		end
		if(counter < ((BASE_SPEED / speed) / 2)) begin
			outClk_d = 0;
		end else begin
			outClk_d = 1;
		end
		if(reset || counter == ((BASE_SPEED / speed) - 1)) begin
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

/*module clock_divider_top #(BASE_SPEED=50000000) (
    input                          clk,
    input      [$clog2(1000000):0] speed,
    input                          reset,
    output reg                     outClk
);

    reg [$clog2(1000000):0] currentSpeed = BASE_SPEED;
    reg [$clog2(BASE_SPEED)+1:0] counter = 0;
    wire [$clog2(BASE_SPEED)+1:0] threshold = BASE_SPEED / currentSpeed;

    reg [$clog2(BASE_SPEED)+1:0] counter_d;
    reg outClk_d;

    always @(posedge clk) begin
        if (reset || counter == threshold - 1) begin
            currentSpeed <= speed;
        end
        counter <= counter_d;
        outClk <= outClk_d;
    end

    always_comb begin
        if (counter < threshold / 2) begin
            outClk_d = 0;
        end else begin
            outClk_d = 1;
        end

        if (reset || counter == threshold - 1) begin
            counter_d = 0;
        end else begin
            counter_d = counter + 1;
        end
    end
endmodule */