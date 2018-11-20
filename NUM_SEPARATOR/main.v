`timescale 100us / 100us
module hello_world;

  // My signal definitions
  wire[7:0] unidades;
  wire[7:0] decenas;
  reg[7:0] numero = 25;
  reg update = 0;
  wire clk;
  clock_gen clk_gen(clk);
  num_separator num_sep(unidades,decenas,numero,update);

  integer index;

  initial begin

    for(index = 0; index < 100; index = index + 1) begin
                numero = index;
                #1
                update  = 1;
                #1
                update = 0;
                $display("el numero es: %d,las decenas %d, las unidades %d",index,decenas,unidades);
            end
    $finish;
  end

  reg dummy;
  reg[8*64:0] dumpfile_path = "output.vcd";

  initial begin
    dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
    $dumpfile(dumpfile_path);
    $dumpvars(0,hello_world);
  end

endmodule // End of Module hello_world



