`timescale 1ms / 100us //Cada N# va a dar N*1ms retardi v
module hello_world;

  // My signal definitions
  wire clk;

  clock_gen clk_gen(clk);
  wire drawPixel;
  wire[9:0] x;
  wire[8:0] y;
  wire[5:0] num = 0;
  wire[5:0] pos = 1;
  reg[7:0] offset = 20;

  singleNumber number(drawPixel,num,x,y,pos,offset,offset);

  initial begin

    #10;
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