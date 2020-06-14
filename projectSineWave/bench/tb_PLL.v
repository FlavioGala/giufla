
`timescale 1ns / 100ps


module tb_PLL ;

/////////////////////////////////
   //   100 MHz clock generator   //
   /////////////////////////////////

   wire clk100 ;

   ClockGen ClockGen_inst (.clk(clk100)) ;

      ///////////////////
   //     DUT       //
   ///////////////////
   
   wire clk300,  pll_locked ;
   
   PLL PLL_inst (.clk_in1(clk100) ,.clk_out1(clk300) ,.locked(pll_locked));
   
     ///////////////////////
   //    stimulous     //
   //////////////////////
   
   initial begin
   
   @(posedge pll_locked)
   
    #(2*650000) $finish ;
	
	end
	
	
	
	endmodule 