//60x100 pixels 
/*
-----------------
|   | | |       |    
|      ||       |
|      ||       |
|      ||       |
|  ---------    |
-----------------
*/
module singleNumber(drawPixel,num,x,y);
    output reg drawPixel; //Da la señal de si es necesario dibujar
    input [9:0] x; //Posición actual en la pantalla X
    input [8:0] y; //Posición actual en la pantalla Y
    input [7:0] num; //Number to display
    parameter pos = 0; //Number to display
    parameter xOffset = 0;
    parameter yOffset = 0;

    parameter square = 20;


//     //FIRST ROW
//     if(y >= yOffset && y < yOffset + square)

//     //SECOND ROW
//     if(y > yOffset + square && y < yOffset +2*square)

//     //THIRD ROW
//     if(y > yOffset + 2*square && y < yOffset + 3*square)

//     //FOURTH ROW
//     if(y > yOffset + 3*square && y < yOffset + 4*square)

//     //FIFTH ROW
//     if(y > yOffset + 4*square && y < yOffset + 5*square)


//     //FIRST COLUMN
//     if(x >= xOffset &&  x <= square + xOffset)
        
//     //SECOND COLUMN
//     if(x >= xOffset + square && x <= 2*square + xOffset)

//     //THIRD COLUMN
//     if(x >= xOffset + 2*square && x <= 3*square + xOffset)

    //Checking position, this line will determine which character the cursor is currently on.
    always @* begin
    if( x > (xOffset + square*(pos-1)) && x < (xOffset + square*pos))
    begin
        if(num == 0)begin
          //FIRST COLUMN
          if(x >= xOffset &&  x <= square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;                
               //SECOND ROW
               else if(y > yOffset + square && y < yOffset +2*square)
                    drawPixel  = 1;
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FOURTH ROW
               else if(y > yOffset + 3*square && y < yOffset +4*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          //SECOND COLUMN    
          else if(x >= xOffset + square && x <= 2*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;
               //FIFTH ROW
               if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          //THIRD COLUMN  
          else if(x >= xOffset + 2*square && x <= 3*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;                
               //SECOND ROW
               else if(y > yOffset + square && y < yOffset +2*square)
                    drawPixel  = 1;
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FOURTH ROW
               else if(y > yOffset + 3*square && y < yOffset +4*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          else
               drawPixel  = 0;
        end

        if(num == 1)begin
          //FIRST COLUMN
          if(x >= xOffset &&  x <= square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;                
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          //SECOND COLUMN    
          else if(x >= xOffset + square && x <= 2*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;                
               //SECOND ROW
               else if(y > yOffset + square && y < yOffset +2*square)
                    drawPixel  = 1;
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FOURTH ROW
               else if(y > yOffset + 3*square && y < yOffset +4*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          //THIRD COLUMN  
          else if(x >= (xOffset + 2*square) && x <= (3*square + xOffset))begin
               //FIFTH ROW
               if(y > (yOffset + 4*square) && y < (yOffset + 5*square))
                    drawPixel  = 1;
          end
          else
               drawPixel  = 0;
        end
  
        if(num == 2)begin 
            //FIRST COLUMN
            if(x >= xOffset &&  x <= square + xOffset)begin
                //FIRST ROW
                if(y >= yOffset && y < yOffset + square)
                     drawPixel  = 1;
                //THIRD ROW
                if(y > yOffset + 2*square && y < yOffset + 3*square)
                     drawPixel  = 1;
                //FOURTH ROW
                if(y > yOffset + 3*square && y < yOffset + 4*square)
                     drawPixel  = 1;
                //FIFTH ROW
                if(y > yOffset + 4*square && y < yOffset + 5*square)
                     drawPixel  = 1;
            end
            //SECOND COLUMN    
            else if(x >= xOffset + square && x <= 2*square + xOffset)begin
                //FIRST ROW
                if(y >= yOffset && y < yOffset + square)
                     drawPixel  = 1;
                //THIRD ROW
                else if(y > yOffset + 2*square && y < yOffset + 3*square)
                     drawPixel  = 1;
                //FIFTH ROW
                else if(y > yOffset + 4*square && y < yOffset + 5*square)
                     drawPixel  = 1;
            end
            //THIRD COLUMN  
            else if(x >= xOffset + 2*square && x <= 3*square + xOffset)begin
                //FIRST ROW
                if(y >= yOffset && y < yOffset + square)
                      drawPixel  = 1;                
                //SECOND ROW
                else if(y > yOffset + square && y < yOffset +2*square)
                      drawPixel  = 1;
                //THIRD ROW
                else if(y > yOffset + 2*square && y < yOffset + 3*square)
                     drawPixel  = 1;
                //FIFTH ROW
                else if(y > yOffset + 4*square && y < yOffset + 5*square)
                     drawPixel  = 1;
            end
            else
                 drawPixel  = 0;
        end
        
        if(num == 3)begin
          //FIRST COLUMN
          if(x >= xOffset &&  x <= square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;
               //THIRD ROW
               if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FIFTH ROW
               if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          //SECOND COLUMN    
          else if(x >= xOffset + square && x <= 2*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;
               //THIRD ROW
               if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FIFTH ROW
               if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          //THIRD COLUMN  
          else if(x >= xOffset + 2*square && x <= 3*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;                
               //SECOND ROW
               else if(y > yOffset + square && y < yOffset +2*square)
                    drawPixel  = 1;
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FOURTH ROW
               else if(y > yOffset + 3*square && y < yOffset +4*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          else
               drawPixel  = 0;
        end        

        if(num == 4)begin
          //FIRST COLUMN
          if(x >= xOffset &&  x <= square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;
               //SECOND ROW
               if(y > yOffset + square && y < yOffset + 2*square)
                    drawPixel  = 1;
               //THIRD ROW
               if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
          end
          //SECOND COLUMN    
          else if(x >= xOffset + square && x <= 2*square + xOffset)begin
               //SECOND ROW
               if(y > yOffset + square && y < yOffset + 2*square)
                    drawPixel  = 1;
          end
          //THIRD COLUMN  
          else if(x >= xOffset + 2*square && x <= 3*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;    
               //SECOND ROW
               if(y >= yOffset + square && y < yOffset + 2*square)
                    drawPixel  = 1;            
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FOURTH ROW
               else if(y > yOffset + 3*square && y < yOffset +4*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          else
               drawPixel  = 0;
        end

        if(num == 5)begin
          //FIRST COLUMN
          if(x >= xOffset &&  x <= square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;
               //SECOND ROW
               if(y > yOffset + square && y < yOffset + 2*square)
                    drawPixel  = 1;
               //THIRD ROW
               if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FIFTH ROW
               if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          //SECOND COLUMN    
          else if(x >= xOffset + square && x <= 2*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          //THIRD COLUMN  
          else if(x >= xOffset + 2*square && x <= 3*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;            
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FOURTH ROW
               else if(y > yOffset + 3*square && y < yOffset +4*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          else
               drawPixel  = 0;
        end

        if(num == 6)begin
          //FIRST COLUMN
          if(x >= xOffset &&  x <= square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;
               //SECOND ROW
               if(y > yOffset + square && y < yOffset + 2*square)
                    drawPixel  = 1;
               //THIRD ROW
               if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FOURTH ROW
               if(y > yOffset + 3*square && y < yOffset + 4*square)
                    drawPixel  = 1;
               //FIFTH ROW
               if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          //SECOND COLUMN    
          else if(x >= xOffset + square && x <= 2*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          //THIRD COLUMN  
          else if(x >= xOffset + 2*square && x <= 3*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;            
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FOURTH ROW
               else if(y > yOffset + 3*square && y < yOffset +4*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          else
               drawPixel  = 0;
        end

        if(num == 7)begin
          //FIRST COLUMN
          if(x >= xOffset &&  x <= square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;
          end
          //SECOND COLUMN    
          else if(x >= xOffset + square && x <= 2*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
          end
          //THIRD COLUMN  
          else if(x >= xOffset + 2*square && x <= 3*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;            
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FOURTH ROW
               else if(y > yOffset + 3*square && y < yOffset +4*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          else
               drawPixel  = 0;
        end

        if(num == 8)begin
          //FIRST COLUMN
          if(x >= xOffset &&  x <= square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;                
               //SECOND ROW
               else if(y > yOffset + square && y < yOffset +2*square)
                    drawPixel  = 1;
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FOURTH ROW
               else if(y > yOffset + 3*square && y < yOffset +4*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          //SECOND COLUMN    
          else if(x >= xOffset + square && x <= 2*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;
               //THIRD ROW
               if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FIFTH ROW
               if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          //THIRD COLUMN  
          else if(x >= xOffset + 2*square && x <= 3*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;                
               //SECOND ROW
               else if(y > yOffset + square && y < yOffset +2*square)
                    drawPixel  = 1;
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FOURTH ROW
               else if(y > yOffset + 3*square && y < yOffset +4*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          else
               drawPixel  = 0;
        end
          
        if(num == 9)begin
          //FIRST COLUMN
          if(x >= xOffset &&  x <= square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;                
               //SECOND ROW
               else if(y > yOffset + square && y < yOffset +2*square)
                    drawPixel  = 1;
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
          end
          //SECOND COLUMN    
          else if(x >= xOffset + square && x <= 2*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;
               //THIRD ROW
               if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
          end
          //THIRD COLUMN  
          else if(x >= xOffset + 2*square && x <= 3*square + xOffset)begin
               //FIRST ROW
               if(y >= yOffset && y < yOffset + square)
                    drawPixel  = 1;                
               //SECOND ROW
               else if(y > yOffset + square && y < yOffset +2*square)
                    drawPixel  = 1;
               //THIRD ROW
               else if(y > yOffset + 2*square && y < yOffset + 3*square)
                    drawPixel  = 1;
               //FOURTH ROW
               else if(y > yOffset + 3*square && y < yOffset +4*square)
                    drawPixel  = 1;
               //FIFTH ROW
               else if(y > yOffset + 4*square && y < yOffset + 5*square)
                    drawPixel  = 1;
          end
          else
               drawPixel  = 0;
        end



    end
    else
     drawPixel  = 0;

end
endmodule














    //FIRST ROW
    // if(y >= yOffset && y < yOffset + square)

    //SECOND ROW
    // if(y > yOffset + square && y < yOffset +2*square)

    //THIRD ROW
    // if(y > yOffset + 2*square && y < yOffset + 3*square)

    //FOURTH ROW
    // if(y > yOffset + 3*square && y < yOffset + 4*square)

    //FIFTH ROW
    // if(y > yOffset + 4*square && y < yOffset + 5*square)


    //FIRST COLUMN
    // if(x >= xOffset &&  x <= square + xOffset)

    //SECOND COLUMN
    // if(x >= xOffset + square && x <= 2*square + xOffset)

    //THIRD COLUMN
    // if(x >= xOffset + 2*square && x <= 3*square + xOffset)