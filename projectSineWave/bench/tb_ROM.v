
//dummy example: instantiate small FIFO into empty top-level


`timescale 1ns / 100ps

module tb_ROM ;


   /////////////////////////////////
   //   100 MHz clock generator   //
   /////////////////////////////////

   wire clk100 ;

   ClockGen   ClockGen_inst (.clk(clk100)) ;


   /////////////////////////////////////////////////
   //    100 KHz read-enable generator as "tick"   //
   /////////////////////////////////////////////////

<<<<<<< HEAD
   wire rd_enable;

   TickCounter  #(10) TickCounter_inst ( .clk(clk100), .tick(rd_enable)) ;
=======
   wire rd_enable ;

   TickCounter  #(.MAX(1000)) TickCounter_inst ( .clk(clk100), .tick(rd_enable)) ;
>>>>>>> 34be4cd16e8945a160df072cb5efc6deb6d39f65


   ///////////////////////////
   //   pointer generator   //
   ///////////////////////////


   reg [5:0] count = 5'd0 ;     // 6-bit counter to cover addresses 0 to 63 

   always @(posedge clk100)
      if(rd_enable)
         count <= #10 count + 1'b1 ;      // add 10 ns delay only for better visualization and easier debug, everything works also without it



   ///////////////////////////
   //   device under test   //
   ///////////////////////////

   wire [31:0] rom_word ;

   ROM   DUT ( .clk(clk100), .address(count[5:0]), .en(rd_enable), .data(rom_word)) ;


   //////////////////
   //   stimulus   //
   //////////////////

   initial begin
<<<<<<< HEAD

      #(2*64*10000) $finish ;
=======
      
      #(2*64*1000) $finish ;
>>>>>>> 34be4cd16e8945a160df072cb5efc6deb6d39f65
   end


   // monitor the ROM content in the simulator console
   always @(posedge clk100)
      $display("%c", rom_word[31:0]) ;

endmodule

