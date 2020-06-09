
//--------------------------------------------
//this is the final module of a sine wave generator
//
//by giulia e flavio
//
//-------------------------------------------

`timescale 1ns / 100ps

module Sine (

   input  wire clk,
   output wire [31:0] sine

   ) ;
   
   //first block
   WidthSine WidthSine_inst (.clk100(clk)) ;
   
   // tick counter
   TickCounter #(.MAX(1000)) tick ( .clk(clk)) ;
   
   
   //32 bit counter
   reg [31:0] counter = 31'd0 ;
   
   always @(posedge clk)
       if ( tick.tick == 1'b1)
	      counter = 31'd0 ;
	   else
          counter <= counter + 1'b1 ;  
   
   
   
   //binary comparator
   assign sine = ( counter < WidthSine_inst.widthSine ) ? 1'b1 : 1'b0 ;
   

   


endmodule
