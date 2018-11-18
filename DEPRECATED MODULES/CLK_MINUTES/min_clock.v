`timescale 100s / 1s //Cada tick en verilog va a durar 100uS. Además la minima unidad seran los 100 uS
module min_clock_gen(min_clk);

output reg min_clk;

parameter PERIOD = 1;
	 
	 //Genera la onda cuadrada
always
	begin: CLOCK_DRIVER //CLOCK_DRIVER es un tag que no es relevante
		min_clk <= 1'b0;	//Se pone el clock en 0, es la bajada
		#(PERIOD*0.3); 	//Semiperiodo del clock
		min_clk <= 1'b1;	//Subida del clock
		#(PERIOD*0.3);	//Segunda parte del periodo
	end
endmodule

