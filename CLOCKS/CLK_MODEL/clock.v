`timescale 100us / 100us
module clock_gen(output reg clk);

parameter PERIOD = 10;
	 
always
	begin: CLOCK_DRIVER
		clk <= 1'b0;
		#(PERIOD/2);
		clk <= 1'b1;
		#(PERIOD/2);
	end
endmodule
