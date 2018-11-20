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
    always @(posedge update)begin // combination logic
        unidades = 0;
        decenas = 0;
        // $display("%d",decenas);
        if(numero >= 90)begin
            decenas = 9;
            unidades = numero-90;
        end
         else if(numero >= 80)begin
            decenas = 8;
            unidades = numero-80;
        end
        else if(numero >= 70)begin
            decenas = 7;
            unidades = numero-70;
        end
        else if(numero >= 60)begin
            decenas = 6;
            unidades = numero-60;
        end
        else if(numero >= 50)begin
            decenas = 5;
            unidades = numero-50;
        end
        else if(numero >= 40)begin
            decenas = 4;
            unidades = numero-40;
        end
        else if(numero >= 30)begin
            decenas = 3;
            unidades = numero-30;
        end
        else if(numero >= 20)begin
            decenas = 2;
            unidades = numero-20;
        end
        else if(numero >= 10)begin
            decenas = 1;
            unidades = numero-10;
        end
        else begin
            decenas = 0;
            unidades = numero;
        end
    end
endmodule
