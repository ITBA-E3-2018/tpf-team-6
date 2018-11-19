//This clock will model the FPGA's internal clock. 
//`timescale 1ns / 1ns
module clock_gen(output reg clk);

parameter PERIOD = 40;
	 
always
	begin: CLOCK_DRIVER
		clk <= 1'b0;
		#(PERIOD/2);
		clk <= 1'b1;
		#(PERIOD/2);
	end
endmodule
