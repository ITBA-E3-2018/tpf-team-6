// module counter(seconds, minutes,toggle,reset,clk_sec,clk_min,clk_hours);
module counter(seconds, minutes,toggle,reset,clk_sec,clk_min,clk_hours);


  input wire toggle; //Will stop counting unless
  input wire reset; //Will drive all counter to zero
  reg[1:0] toggleState = 1;//1 --> Count, 0 -->Not Count

  input wire clk_sec;   //SECONDS Clock singal T = 1seg, use falling edge detection
  input wire clk_min;   //MINUTES Clok signal  T = 1min, use falling edge detection
  input wire clk_hours; //HOURS Clok signal  T = 1hour, use falling edge detection


  parameter WIDTH = 8;

//Start counter in -1. GtkWave simulation counts falling edge at the beggining (Double check during synthesis required)
  output reg [WIDTH-1 : 0] seconds  = -1; 
  output reg [WIDTH-1 : 0] minutes  = -1;
  output reg [WIDTH-1 : 0] hours    = -1;


//SECONDS
//Detection of falling edge in clk_sec singal
  always @(negedge clk_sec)
  begin
    seconds <= seconds + 1;  //Asyn assing, increase 1 second
    if(seconds == 59)        //Avoid overflow and restart counter
      seconds <= 0;
  end

//MINUTES
//Detection of falling edge in clk_min singal
  always @(negedge clk_min)
  begin  
    minutes <= minutes + 1;   //Se hace la asignación instantanea,,
    if(minutes == 59)        //Avoid overflow and restart counter
      minutes <= 0;
  end

//HOURS
//Detection of falling edge in clk_min singal
  always @(negedge clk_hours)
  begin  
    hours <= hours + 1;   //Se hace la asignación instantanea,,
    if(hours == 99)        //Avoid overflow and restart counter
      hours <= 0;
  end

endmodule // counter