
//--------------------------------------------
//this is the final tb_module of a sine wave generator
//
//by giulia e flavio
//
//-------------------------------------------

`timescale 1ns / 100ps

module tb_Sine ;

         /////////////////////////////////
   //   100 MHz clock generator   //
   /////////////////////////////////

   wire clk100 ;

   ClockGen ClockGen_inst (.clk(clk100)) ;

      ///////////////////
   //     DUT       //
   ///////////////////
   
   wire [31:0] pippo ;
   
   Sine sine_inst (.clk(clk100), .sine(pippo) ) ;
   
      ///////////////////////
   //    stimulous     //
   //////////////////////
   
   initial begin
   
      #(2*650000) $finish ;
	  
   end



endmodule