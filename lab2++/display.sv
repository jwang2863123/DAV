module display(
	input [8:0] switches, input sel, output [7:0] led1, output [7:0] led2, output [7:0] led3, output [7:0] led4,
	output [7:0] led5, output [7:0] led6
);
	reg [3:0] digit1;
	reg [3:0] digit2;
	reg [3:0] digit3;
	reg [3:0] digit4;
	reg [3:0] digit5;
	reg [3:0] digit6;
	
	/* TODO: Instantiate six copies of sevenSegDigit, one for each digit (calculated below)*/
	digit digit_6(digit1, sel, led6);
	digit digit_5(digit2, sel, led5);
	digit digit_4(digit3, sel, led4);
	digit digit_3(digit4, sel, led3);
	digit digit_2(digit5, sel, led2);
	digit digit_1(digit6, sel, led1);
	// The following block will contain the logic of your combinational circuit
	always_comb begin
		/* TODO: Convert a 20-bit input number to six individual digits (4 bits each) */
		digit1 = switches / 600;
		digit2 = (switches / 60) % 10;
		digit3 = (switches % 60) / 10;
		digit4 = (switches % 10);
		digit5 = 0;
		digit6 = 0;
	end

endmodule