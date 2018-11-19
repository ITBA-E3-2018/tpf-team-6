module time_counter(secs,mins,hours,reset,clock);
	output reg[5:0] secs;
	reg[5:0] dummySecs = 0;

	output reg[5:0]	mins;
	reg[5:0] dummyMins = 0;


	output reg[5:0]	hours;
	reg[5:0] dummyHours = 0;

	reg [24:0]counter = 24'b0;			//This counter will keep track of the amount of clock pulses

	input wire reset;
	input wire clock;
	parameter secondReference = 250;	//CAMBIAR CUANDO SE PASA A QUARTUS
	always@(posedge clock) begin
		counter += 1;
		if(counter % secondReference == 0)begin
			dummySecs += 1;
			secs <= dummySecs;
		end
	end
endmodule