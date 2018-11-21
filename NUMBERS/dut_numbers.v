`timescale 1ms / 100us //Cada N# va a dar N*1ms retardi v
module hello_world;

  // My signal definitions
  wire clk;

  clock_gen clk_gen(clk);
  wire drawPixel;
  wire[9:0] x;    //Current pixel x position
  wire[8:0] y;    //Current pixel y position
  wire[7:0] num = 1;

  singleNumber number(drawPixel,num,x,y);
  
  wire o_hs;
  wire o_vs;
  wire o_blanking;
  wire o_active;
  wire o_screened;
  wire o_animated;
  wire reset  = 1;

 
  vga640x480 myMonitor(clk,clk,reset,o_hs,o_vs,o_blanking,o_active,o_screened,o_animated,x,y);
  
  
  initial begin

    #100;
    $finish;

  end

  // Additional documentation on $dumpfile and $dumpvars: http://referencedesigner.com/tutorials/verilog/verilog_62.php
  // Setup to allow us to pass an output path for $dumpfile
  reg dummy;
  reg[8*64:0] dumpfile_path = "output.vcd";

  initial begin
    dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
    $dumpfile(dumpfile_path);
    $dumpvars(0,hello_world);
    $display("hola");
  end

endmodule // End of Module hello_world