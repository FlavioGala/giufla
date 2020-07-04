//test bench della widthSine

//giulia e flavio


`timescale 1ns / 100ps

module tb_ROM_mapping ;



   /////////////////////////////////
   //   100 MHz clock generator   //
   /////////////////////////////////

   wire clk100 ;

   ClockGen ClockGen_inst (.clk(clk100)) ;
   
   
   
   // TICK COUNTER INST
   
   wire tick ;
   wire tick_enable ;   
  
   TickCounter #(.MAX(1000)) tick_inst (.clk(clk), .en(tick_enable), .tick(tick)) ;
   
   
   
   ///////////////////
   //     DUT       //
   ///////////////////
   
   wire [31:0] width ;
   wire tick_enable = 1'b1 ;
   wire SO ;
   wire load = ROM_mapping.load ;
   
   wire SI_en ;
   wire soc ;
      
   ROM_mapping ROM_mapping_inst (.clk(clk100), .widthSine(width), .tick_enable(tick_enable), .SO(SO), .SI_en(SI_en), .soc(soc), .tick(tick) ) ;
   
   
   
   
   ///////////////////////
   //    stimulous     //
   //////////////////////
   
   initial begin
   
      #(100000) $finish ;
	  
   end


endmodule