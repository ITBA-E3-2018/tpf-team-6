//TestBench of clock signals and counter module
module hello_world;

  // My signal definitions
  wire clk_sec;
  wire clk_min;
  wire clk_hours;

  wire reset;
  wire toggle;

  hours_clock_gen hours_clk_gen(clk_hours);
  min_clock_gen min_clk_gen(clk_min);
  sec_clock_gen sec_clk_gen(clk_sec);

  //reg reset = 0;

  wire[7:0] seconds;
  wire[7:0] minutes;
  wire[7:0] hours;

  //Estamos enviando un parametro
  counter my_counter(seconds, minutes, toggle, reset, clk_sec,clk_min,clk_hours);

  initial begin

    #10000;
    $finish;

  end
  
  // initial  begin
  //   $monitor(seconds);
  // end

  // Additional documentation on $dumpfile and $dumpvars: http://referencedesigner.com/tutorials/verilog/verilog_62.php
  // Setup to allow us to pass an output path for $dumpfile
  reg dummy;
  reg[8*64:0] dumpfile_path = "output.vcd";

  initial begin
    dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
    $dumpfile(dumpfile_path);
    $dumpvars(0,hello_world);
  end

endmodule // End of Module hello_world



