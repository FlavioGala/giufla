
//--------------------------------------------
//this is the final module of a sine wave generator
//
//by giulia e flavio
//
//-------------------------------------------

`timescale 1ns / 100ps

module Sine_PWM (

   input  wire clk_100, en,
   output wire sine

   ) ;
   
   
   
   ///////////   
   //  PLL  //
   ///////////
   
   wire clk_200 ;
   
   wire locked ;
   
   PLL2 PLL2_inst (
 
      .clk_out       (clk_200),      // output clk_out1
      .locked        (locked),       // output locked
      .clk_in        (clk_100)       // input clk_in1
   
   );      
   



   //first block
   
   wire [31:0] width ;
   
<<<<<<< HEAD
   WidthSine WidthSine_inst (.clk(clk_200), .widthSine(width), .tick_enable(locked)) ;
=======
   ROM_mapping ROM_mapping_inst (.clk(clk_200), .widthSine(width), .enable(locked)) ;
   
   
>>>>>>> be594073ba18d1320dab509873a46d5dbe20bc9d
   
   // tick counter
   
   wire tick ;
   
   TickCounter #(.MAX(1000)) tick_inst ( .clk(clk_200), .en(locked), .tick(tick)) ;
   
   
   
   //32 bit counter
   
   reg [31:0] counter = 31'd0 ;
   
   always @(posedge clk_200) 
   
       if ( tick == 1'b1) counter = 31'd0 ;
	      
	   else               counter <= counter + 1'b1 ;
            
   
   
   
   //binary comparator
   
   wire sine_test ;
   
   assign sine_test = ( counter < width ) ? 1'b1 : 1'b0 ;
   
   assign sine      = ( en == 1'b0 ) ? sine_test : 1'b1 ;             // active low enable





endmodule



