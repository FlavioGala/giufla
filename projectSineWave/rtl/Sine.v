
//--------------------------------------------
//this is the final module of a sine wave generator
//
//by giulia e flavio
//
//-------------------------------------------

`timescale 1ns / 100ps

module Sine (

   input  wire clk_100,
   output wire sine

   ) ;
   
   //first block
   wire [31:0] width ;
   
   WidthSine WidthSine_inst (.clk(clk_300), .widthSine(width), .enable(locked)) ;
   
   // tick counter
   wire tick ;
   
   TickCounter #(.MAX(1000)) tick_inst ( .clk(clk_300), .en(locked), .tick(tick)) ;
   
   
   //32 bit counter
   reg [31:0] counter = 31'd0 ;
   
   always @(posedge clk_300)
       if ( tick == 1'b1)
	      counter = 31'd0 ;
	   else
          counter <= counter + 1'b1 ;  
   
   
   
   //binary comparator
   assign sine = ( counter < width ) ? 1'b1 : 1'b0 ;



   ///////////   
   //  PLL  //
   ///////////
   
   wire clk_300 ;
   
   wire locked ;
   
     PLL PLL_inst
   (
    // Clock out ports
    .clk_out1(clk_300),     // output clk_out1
    // Status and control signals
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk_100));      // input clk_in1




endmodule
