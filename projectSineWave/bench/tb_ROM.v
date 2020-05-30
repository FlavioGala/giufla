
//dummy example: instantiate small FIFO into empty top-level


`timescale 1ns / 100ps

module tb_ROM ;


   /////////////////////////////////
   //   1 MHz clock generator   //
   /////////////////////////////////

   wire clk1 ;

   ClockGen   ClockGen_inst (.clk(clk1)) ;


   /////////////////////////////////////////////////
   //    10 MHz read-enable generator as "tick"   //
   /////////////////////////////////////////////////

   wire rd_enable = 1'b1 ;

   //TickCounter  #(.MAX(10)) TickCounter_inst ( .clk(clk1), .tick(rd_enable)) ;


   ///////////////////////////
   //   pointer generator   //
   ///////////////////////////


   reg [5:0] count = 5'd0 ;     // 6-bit counter to cover addresses 0 to 63 

   always @(posedge clk1)
      if(rd_enable)
         count <= #10 count + 1'b1 ;      // add 10 ns delay only for better visualization and easier debug, everything works also without it



   ///////////////////////////
   //   device under test   //
   ///////////////////////////

   wire [63:0] rom_word ;

   ROM   DUT ( .clk(clk1), .address(count[5:0]), .en(rd_enable), .data(rom_word)) ;


   //////////////////
   //   stimulus   //
   //////////////////

   initial begin

      #(2*64*1000) $finish ;
   end


   // monitor the ROM content in the simulator console
   always @(posedge clk1)
      $display("%c", rom_word[63:0]) ;

endmodule
