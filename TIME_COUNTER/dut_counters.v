//`timescale 100ns / 100ns 
`timescale 100us / 100us //CLOCK FREQUENCY = 40*timescale--> 40*100us == 1/250 --> se necesitan 250 pulsos para hacer 1 segundo
module hello_world;

  // My signal definitions
  wire clk;
  reg reset = 0; 
  reg startStop = 0; //
  wire[7:0]seconds;
  wire[7:0]minutes;
  wire[7:0]hours;

//Modules
  clock_gen clk_gen(clk); 
  time_counter t_counter(seconds,minutes,hours,reset,startStop,clk);


  initial begin

    #500000;
    startStop  = 1;
    #100
    startStop  = 0;
    #40000    
    startStop  = 1;
    #100
    startStop  = 0;
    #100000
    reset = 1;
    #100
    reset = 0;
    #20000
    $finish;

  end

  reg dummy;
  reg[8*64:0] dumpfile_path = "output.vcd";

  initial begin

    //Testing 
    dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
    $dumpfile(dumpfile_path);
    $dumpvars(0,hello_world);
    $display("hola");
  end

endmodule // End of Module hello_world