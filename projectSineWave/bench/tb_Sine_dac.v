
//
// test bench for the source code in system verilog
//

`timescale 1ns / 100ps

module tb_Sine_dac ;



   // CLOCK A 100 MHz
   
   wire clk100 ;
   
   ClockGen ClockGen_inst (.clk(clk100)) ;   



   //////////
   // DUT  //
   //////////

   reg dac_enable = 1'b1 ;
   
   real A_out ;
   real A_out_test = Sine_dac_inst.A_out_test ;
   wire SI = Sine_dac_inst.SI ;

   Sine_dac Sine_dac_inst (

      .clk                (clk100),
	  .en             (dac_enable),
	  .A_Sine_data         (A_out)

      ) ;
   	
	
	
	
	//////////////////
	//  STIMOULUS   //
	//////////////////
	
	
   integer  i ;
   integer  j ;
   real     Aout_expected = 0.0 ;
   real     Vref = 5.0 ;
   real     digit ;
   wire     NOT_LD = Sine_dac_inst.soc ;
   wire     [11:0] I_data = Sine_dac_inst.SI_DAC_inst.pdata ;
	
	
	
	// FIRST STIMOLOUS FOR THE ANABLE
	
   initial begin
	
      #70000 dac_enable = 1'b0 ; 
      #30000 dac_enable = 1'b1 ;  
      #30000 dac_enable = 1'b0 ;
      #30000 dac_enable = 1'b1 ;
      #100000 $finish ;
	  
   end   

   always @(posedge NOT_LD) begin
	  
      Aout_expected = 0.0 ;
	  
      for ( i = 0 ; i <= 11 ; i = i + 1 ) begin  
		  
         real a = 2.0 ;
			   
         for ( j = 11 ; j > i ; j = j - 1 ) begin
			 
            a = a*2.0 ;
				
         end // for
			
         assign digit = I_data[i] ;
			   
         Aout_expected = Aout_expected + Vref*(digit/a) ;
		
      end // for
	  
      $display ( "\n\n D_out should be : %f V at time %d ns \n\n" ,  Aout_expected , $time ) ;
	  
   end // always
	   
	   
/* 	   
   // THIRD STIMOLOUS
	
   integer f ;    

   initial begin

      #10000 f = $fopen("Dac_data.txt") ;        // open the file handler

      #(2*650000) $fclose(f) ; $finish ;         
	  
   end


   always @(posedge NOT_LD) begin                // register dac data whenever the soc is asserted 
      
	  $fdisplay( f , "%f" , A_out , $time ) ;
   
   end 	 */
	   
endmodule




	   
	   