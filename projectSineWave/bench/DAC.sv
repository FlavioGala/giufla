<<<<<<< HEAD

// DAC 32 bit

`timescale 1ns / 100ps

module DAC #(parameter real Vref = 3.3) (


   input wire clk,
   input wire [11:0] I_data,
   input real digit,
   input wire en,
   output real A_out
   
   ) ;
   
   /////////////////
   // BEHAVIOURAL //
   /////////////////
   
   integer i ; 
   integer j  ;
   
   
   
      always @(posedge clk) begin
	  
         if (en==1'b1) begin 
         A_out = 0.0 ;	
	  	     	 	 
	     for (i=0; i <=11; i= i + 1) begin  
		  
		    
	        real a = 2.0 ;
			for (j = 11; j > i; j= j - 1) begin
			 
			   a = a*2.0 ;
				
		    end // for
			
            assign digit = I_data[i] ;			
		    A_out = A_out + Vref*(digit/a) ;
			
		    $display("A_out is = %.2f a is %.2f digit is %.2f", A_out, a, digit) ;
           		
	     end // for
		 
	   end // always  

   end // if 

endmodule : DAC
=======
>>>>>>> 9f7a00057d6e3267e1cff705205415341bb242d1
