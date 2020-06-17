
// DAC 32 bit

`timescale 1ns / 100ps

module DAC #(parameter real Vref = 3.3) (

   //input wire en?????
   input wire clk,
   input wire [7:0] I_data,
   input real digit,
   input wire en,
   output real A_out
   
   ) ;
   
   /////////////////
   // BEHAVIOURAL //
   /////////////////
   
   always @(posedge clk) begin
      
	  integer i = 0 ;
	  if (en) begin      
	     
         assign A_out = 0.0 ;		 
		 for (i=0; i <=7; i= i + 1) begin  
		  
		    integer j = 7 ;
	        real a = 2.0 ;
			for (j = 7; j > i; j= j - 1) begin
			 
			   a = a*2.0 ;
				
		    end // for
			
            assign digit = I_data[i] ;			
		    A_out = A_out + Vref*(digit/a) ;
		    $display("A_out is = %.2f a is %.2f digit is %.2f", A_out, a, digit) ;
           		
	     end // for
	  
	  end // if    
	  
   end // always   
   
   
endmodule : DAC