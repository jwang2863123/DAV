module alarmClock_top(input onoff, input reset, input [8:0] switches, input speedSwitch, input clock, 
	output buzzer,	output [7:0] led1, output [7:0] led2, output [7:0] led3, output [7:0] led4, output [7:0] led5, output [7:0] led6);
	
	reg outClk;
	reg blink;
	reg [1:0] action;
	reg [8:0] nextTime;
	
	clock_divider theClock (clock, 50000000, reset, outClk);
	display theDisplay (nextTime, blink, led1, led2, led3, led4, led5, led6);
	alarmController theAlarm (switches, reset, speedSwitch, outClk, nextTime);
	//clock_divider theBuzzer(clock, nextTime, 113636, reset, buzzer);
		
endmodule