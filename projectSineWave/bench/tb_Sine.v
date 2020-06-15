
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
   
   wire pippo ;
   
   Sine sine_inst (.clk_100(clk100), .sine(pippo) ) ;
   
   ///////////////////////
   //    stimulous     //
   //////////////////////
   
 
   
       /* initial begin
	   
	   always @ (posedge clk100) 
	   
      $display("\t\t   time   ") ;
      $monitor("%d ns   ",$time) ;
	  $stop;
	  
   end */


   // dump waveforms into industry-standard Value Change Dump (VCD) database
   initial begin
      $dumpfile ("waveforms.vcd") ;
      $dumpvars ;
   end
     
	 initial begin
      #(660000) $finish ;
	  
	  
	  
	  
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