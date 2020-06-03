//test bench della widthSine

//giulia e flavio


`timescale 1ns / 100ps

module tb_WidthSine ;

      /////////////////////////////////
   //   100 MHz clock generator   //
   /////////////////////////////////

   wire clk100 ;

   ClockGen ClockGen_inst (.clk(clk100)) ;
   
   ///////////////////
   //     DUT       //
   ///////////////////
   
   wire [31:0] width ;
   
   WidthSine Width (.clk100(clk100), .widthSine(width) ) ;
   
   
   ///////////////////////
   //    stimulous     //
   //////////////////////
   
   initial begin
   
      #(2*650000) $finish ;
	  
   end


endmodule