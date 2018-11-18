//The objective of this module is to split a 2 digits number into it's tens and units
//45 --> 4  5;   67 --> 6  7

//This module will be connected to a 7 bit register that contains a numbers
//The output will be the splitted 2 digit number. e.g: 45--> 4   5
//The update will occur in the falling edge of the 'update' signal

module num_separator(unidades,decenas,numero,update);
    output reg[7:0] unidades;
    output reg[7:0] decenas;
    input wire[7:0] numero;
    
    input update;
    integer index;
   
   //unidades y decenas will be updated wiht falliin edges from 'update' signal
    always @(negedge update)begin // combination logic
    unidades = 0;
    decenas = 0;
        for(index = 0; index < 100; index = index + 1) begin
            if((numero - unidades)%10 != 0) begin
                 unidades = unidades + 1; 
            end
        end
         decenas = (numero-unidades)/10;
    end
endmodule
