//`timescale 100ns / 100ns 
`timescale 100us / 100us //CLOCK FREQUENCY = 40*timescale--> 40*100us == 1/250 --> se necesitan 250 pulsos para hacer 1 segundo
module hello_world;

  // My signal definitions
  wire clk;
  wire reset;
  wire[7:0]seconds;
  wire[7:0]minutes;
  wire[7:0]hours;

//Modules
  clock_gen clk_gen(clk); 
  time_counter t_counter(seconds,minutes,hours,reset,clk);


  initial begin

    #1000000;
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