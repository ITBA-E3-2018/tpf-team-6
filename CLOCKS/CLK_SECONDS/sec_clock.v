`timescale 1s / 100us //Cada tick en verilog va a durar 100uS. Además la minima unidad seran los 100 uS
module sec_clock_gen(output reg sec_clk);

parameter PERIOD = 1;
	 
always
	begin: CLOCK_DRIVER //CLOCK_DRIVER es un tag que no es relevante
		sec_clk <= 1'b0;	//Se pone el clock en 0, es la bajada
		#(PERIOD*0.5); 	//Semiperiodo del clock
		sec_clk <= 1'b1;	//Subida del clock
		#(PERIOD*0.5);	//Segunda parte del periodo
	end
endmodule
