`timescale 1ns / 1ns 
module hello_world;

  // My signal definitions
  wire clk;

  clock_gen clk_gen(clk);

  initial begin

    #10;
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