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
   wire tick_enable = 1'b1 ;
   wire SO ;
   
   wire [4:0] ShiftCounter = Width.ShiftCounter ;
   wire load = Width.load ;
   wire [7:0] pdata = Width.pdata ;
   wire SI_en ;
   wire soc ;
   wire tick = Width.tick ;
   
   
   WidthSine Width (.clk(clk100), .widthSine(width), .tick_enable(tick_enable), .SO(SO), .SI_en(SI_en), .soc(soc) ) ;
   
   
   ///////////////////////
   //    stimulous     //
   //////////////////////
   
   initial begin
   
      #(100000) $finish ;
	  
   end


endmodule