
///////////////////////////////////
// DAC to generate a Sine Wave   //
//                               //
// Giulia e Flavio               //
// 10/ 06 / 1997                 //
///////////////////////////////////


`include "discipline.h"
`include "constants.h"


`timescale 1ns / 100ps

module DAC (

   input reg [31:0] I_data,              // 32 bit data sine from the ROM
   input wire clk,                        // it will be the ticker
   output reg A_out                      // it will turn out that A-out has a decimal radex

   ) ;


   /////////////////
   // BEHAVIOURAL //
   /////////////////
   
   always @(posedge clk) begin
      
	  integer i = 0 ;
	  
	  for (i=0; i <=31; i= i + 1) begin  
	     
		  if ( i==0 ) A_out = I_data[i] ;
			 
		  else begin	
		  
		     integer j = 1 ;
			 integer a = 2 ;
			 
			 for (j = 1; j < i; j= j + 1) begin
			 
			    a = a*2 ;
				
		     end // for
			 
		     A_out = A_out + a*I_data[i] ;
			 			 
		   end // else
	   
	   end // for
	  
   end // always
 
 begin


endmodule