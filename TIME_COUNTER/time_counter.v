module time_counter(seconds,minutes,hours,reset,clock);
	input wire reset;
	input wire clock;
	
	//Keeping track of the seconds ellapsed (MAX SECONDS = 59)
	output reg [7 : 0] seconds  = 0; 

	//Keeping track of the minutes ellapsed (MAX MINS = 59)
	output reg[7:0]	minutes = 0;

	// Keeping track of the hours ellapsed (MAX HOURS = 99)
	output reg[7:0]	hours = 0;

	//This counter will keep track of the amount of clock pulses
	reg [24:0]counter = 24'b0;		

	//TODO: cambiar linea debajo para adapatar a la FPGA
	//!Atención! se debe cambiar cuando se use en QUARTUS
	// parameter secondReference = 25*(10^6);	//CAMBIAR CUANDO SE PASA A QUARTUS. Amount of clock ticks that represent a SECOND
	parameter secondReference = 250; //!<-- AHI!
	
	//Detection of falling edge in clk_sec singal
	always @(posedge clock)
	begin
		counter += 1;
		//If the counter has reached de second reference we add +1 seconds
		if(counter == secondReference)begin
			counter = 0; // Reset counter
			seconds <= seconds + 1;			//Counts a new second after "secondReference" clock pulses

			if(seconds == 59)  //If seconds limit has been reached, then reset
			begin
				begin
					seconds <= 0;
					minutes <= minutes + 1;
				end
				if(minutes == 59)	//If minutes limit has been reached, then reset and add +1 Hour
					begin
						minutes <= 0;
						hours <= hours + 1;
					end
						if(hours == 99)
							hours <= 0;
			end
		end
	end
endmodule