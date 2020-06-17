
// DAC 32 bit

`timescale 1ns / 100ps

module DAC #(parameter real Vref = 3.3) (

   //input wire en?????
   input wire clk,
   input wire [7:0] I_data,
   input real digit,
<<<<<<< HEAD
=======
   input wire en,
>>>>>>> cb8d6fa7c2b056faf915b3a6fb882e56b2b196a0
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
		  
<<<<<<< HEAD
		integer j = 7 ;
	    real a = 2.0 ;
			 
		   for (j = 7; j > i; j= j - 1) begin
=======
		    integer j = 7 ;
	        real a = 2.0 ;
			for (j = 7; j > i; j= j - 1) begin
>>>>>>> cb8d6fa7c2b056faf915b3a6fb882e56b2b196a0
			 
			   a = a*2.0 ;
				
<<<<<<< HEAD
		   end // for
			
           assign digit =I_data[i] ;
		   
		   A_out = A_out + Vref*(I_data[i]/a) ;
		   $display("A_out is = %.2f a is %.2f digit is %.2f", A_out, a digit) ;
=======
		    end // for
			
            assign digit = I_data[i] ;			
		    A_out = A_out + Vref*(digit/a) ;
		    $display("A_out is = %.2f a is %.2f digit is %.2f", A_out, a, digit) ;
>>>>>>> cb8d6fa7c2b056faf915b3a6fb882e56b2b196a0
           		
	     end // for
	  
	  end // if    
	  
   end // always   
   
   
endmodule : DAC