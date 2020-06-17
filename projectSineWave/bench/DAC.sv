
// DAC 32 bit

`timescale 1ns / 100ps

module DAC #(parameter real Vref = 3.3) (

   //input wire en?????
   input wire clk,
   input wire [7:0] I_data,
   output real A_out
   
   ) ;
   
   /////////////////
   // BEHAVIOURAL //
   /////////////////
   
   always @(posedge clk) begin
      
	  integer i = 0 ;
	  
	  for (i=0; i <=7; i= i + 1) begin  
		  
		integer j = 7 ;
	    integer a = 2 ;
			 
		   for (j = 7; j > i; j= j - 1) begin
			 
			 a = a*2 ;
				
		   end // for
			 
		   A_out = A_out + Vref*(I_data[i]/a) ;
		   $display("A_out is = %.2f V is %.2f ", A_out, a) ;
           		
	  end // for
	  
   end // always   
   
   
endmodule : DAC