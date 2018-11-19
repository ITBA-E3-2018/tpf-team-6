//`timescale 100ns / 100ns 
`timescale 100us / 100us //CLOCK FREQUENCY = 40*timescale--> 40*100us == 1/250 --> se necesitan 250 pulsos para hacer 1 segundo
module hello_world;


  // My signal definitions
  wire clk;
  wire reset;
  wire[5:0]secs  = 0 ;
  wire[5:0]mins  = 0;
  wire[5:0]hours = 0;

  //MODULE   NAME
  clock_gen clk_gen(clk);
  time_counter t_counter(secs,mins,hours,reset,clk);
  initial begin

    #30000;
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