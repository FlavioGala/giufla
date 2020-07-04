
//////////////////////////////////////////////////////////////
// a module to implement a "virtual DAC in system verilog   //
//                                                          //
// Giulia e Flavio                                          //
// spring 2020                                              //
//////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module DAC #(parameter real Vref = 5.0) (

   input  wire clk,
   input  wire [11:0] I_data,
   input  real digit,
   input  wire en,
   output real A_out
   
   ) ;

   
   
   
   /////////////////
   // BEHAVIOURAL //
   /////////////////
   
   integer i ; 
   
   integer j ;   
   
   always @(posedge clk) begin
	  
      if ( en == 1'b1 ) begin 
		 
         A_out = 0.0 ;	
	  	     	 	 
         for ( i=0 ; i <= 11 ; i = i + 1 ) begin  
		  
            real a = 2.0 ;
			   
            for ( j = 11 ; j > i ; j = j - 1 ) begin
			 
               a = a*2.0 ;
				
            end // for
			
            assign digit = I_data[i] ;
			   
            A_out = A_out + Vref*(digit/a) ;
           		
         end // for
		 
      end // if  

   end // always
   
   

endmodule : DAC





