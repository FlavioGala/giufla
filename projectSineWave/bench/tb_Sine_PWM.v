
//--------------------------------------------
//this is the final tb_module of a sine wave generator
//
//by giulia e flavio
//
//-------------------------------------------

`timescale 1ns / 100ps

module tb_Sine_PWM ;


   /////////////////////////////////
   //   100 MHz clock generator   //
   /////////////////////////////////

   wire clk100 ;

   ClockGen ClockGen_inst (.clk(clk100)) ;


   ///////////////////
   //     DUT       //
   ///////////////////
   
   wire pippo ;
   
   reg PWM_enable = 1'b0 ;
   
   Sine_PWM sine_PWM_inst (.clk_100(clk100), .sine(pippo), .en(PWM_enable) ) ;
   
   
   
   ///////////////////////
   //    stimulous     //
   //////////////////////
   
   time t1, t2, t3, t4 ;

   initial begin

      #70000 PWM_enable = 1'b1 ; 
      t1 = $time ; 
      $display("\n\npippo is = %.2f at time %.2f\n\n", pippo, t1) ;

      #30000 PWM_enable = 1'b0 ;
      t2 = $time ; 
      $display("\n\npippo is = %.2f at time %.2f\n\n", pippo, t2) ;	   

      #30000 PWM_enable = 1'b1 ;
      t3 = $time ; 
      $display("\n\npippo is = %.2f at time %.2f\n\n", pippo, t3) ;

      #30000 PWM_enable = 1'b0 ;
      t4 = $time ; 
      $display("\n\npippo is = %.2f at time %.2f\n\n", pippo, t4) ;

      #660000 $finish ;

   end   

   
/* integer f ;    // the $fopen Verilog task returns a 32-bit integer

   initial begin

      #10000 f = $fopen("datiLTspice.txt") ;      // open the file handler

      #(2*650000) $fclose(f) ; $finish ;   // simply run for some time and observe the pseudo-random output bit pattern
   end


   always @(posedge clk100) begin    // register pseudo-random bit values to ASCII file whenever a "tick" is asserted inside the LFSR
      
	  $fdisplay(f,"%b", pippo, $time) ;
   
   end */


endmodule