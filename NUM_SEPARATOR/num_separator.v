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
        if(decenas >= 10)begin
            decenas = 10;
            unidades = numero-10;
        end

        else if(decenas >= 20)begin
            decenas = 20;
            unidades = numero-20;
        end

        else if(decenas >= 30)begin
            decenas = 30;
            unidades = numero-30;
        end
        else if(decenas >= 40)begin
            decenas = 40;
            unidades = numero-40;
        end

        else if(decenas >= 50)begin
            decenas = 50;
            unidades = numero-50;
        end
        
        else if(decenas >= 60)begin
            decenas = 60;
            unidades = numero-60;
        end

        else if(decenas >= 70)begin
            decenas = 70;
            unidades = numero-70;
        end

        else if(decenas >= 80)begin
            decenas = 80;
            unidades = numero-10;
        end

        else if(decenas >= 90)begin
            decenas = 90;
            unidades = numero-90;
        end
        
        else if(decenas < 10)begin
            decenas = 0;
            unidades = numero;
        end

    end
endmodule
