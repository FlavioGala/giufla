//-----------------------------------------------------------------------------------------------------
//                               University of Torino - Department of Physics
//                                   via Giuria 1 10125, Torino, Italy
//-----------------------------------------------------------------------------------------------------
// [Filename]       TickCounter.v [RTL]
// [Project]        Advanced Electronics Laboratory course
// [Author]         Luca Pacher - pacher@to.infn.it
// [Language]       Verilog 2001 [IEEE Std. 1364-2001]
// [Created]        May 19, 2020
// [Modified]       -
// [Description]    Parameterized modulus-MAX 32-bit tick generator. Use the resulting "tick"
//                  single clock-pulse as "enable" for your synchronous logic if you need to
//                  decrease the speed of the data processing without the need of a dedicated
//                  extra clock signal.
// [Notes]          -
// [Version]        1.0
// [Revisions]      19.05.2020 - Created
//-----------------------------------------------------------------------------------------------------


//
// Dependencies :
//
// n/a
//

`timescale 1ns / 100ps

module TickCounter #(parameter integer MAX = 1000) (      // 100KHz, T = 10us con FPGA CLK = 100MHz

   input  wire clk,      // assume 100 MHz input clock
   output reg  tick      // single clock-pulse output

   ) ;


   /////////////////////////////////////////////////
   //   32-bit modulus-MAX free-running counter   //
   /////////////////////////////////////////////////

   //
   // **NOTE
   //
   // Assuming 100 MHz input clock we can generate up to 2^32 -1 different tick periods, e.g.
   //
   // MAX =    10 => one "tick" asserted every    10 x 10 ns = 100 ns  => logic "running" at  10 MHz
   // MAX =   100 => one "tick" asserted every   100 x 10 ns =   1 us  => logic "running" at   1 MHz
   // MAX =   200 => one "tick" asserted every   200 x 10 ns =   2 us  => logic "running" at 500 MHz
   // MAX =   500 => one "tick" asserted every   500 x 10 ns =   5 us  => logic "running" at 200 kHz
   // MAX =  1000 => one "tick" asserted every  1000 x 10 ns =  10 us  => logic "running" at 100 kHz
   // MAX = 10000 => one "tick" asserted every 10000 x 10 ns = 100 us  => logic "running" at  10 kHz etc.
   //

   reg [31:0] count = 32'd0  ;      // **IMPORTANT: unused bits are simply DELETED by the synthesizer !

   always @(posedge clk) begin

      if( count == MAX-1 ) begin

         count <= 32'd0 ;           // force the roll-over
         tick  <= 1'b1 ;            // assert a single-clock pulse each time the counter resets

      end
      else begin

         count <= count + 1'b1 ;
         tick  <= 1'b0 ;

      end    // if
   end   // always

endmodule

