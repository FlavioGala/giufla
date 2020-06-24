
// module to manage the serial transmission of data to the Serial Input 12 bit DAC

// Giulia e Flavio
// spring 2020


//////////////////////////////////////////////////////
// a module to manage the serial data transmission  //
//                                                  //
// Giulia e Flavio                                  //
// spring 2020                                      //
//////////////////////////////////////////////////////

`timescale 1ns / 100ps

module Transmission (
   
   input  wire clk, tick,
   input  wire load,
   output reg  en,            // for the INPUT SHIFT REGISTER
   output reg  soc            //START OF CONVERSION FOR THE DAC

   ) ;
   
   
   //a counter to state the end of conversion
   reg [2:0] en_counter  = 3'd0  ;
   reg [1:0] soc_counter = 2'b00 ;              // 2-bit counter!!!
   
   
   ///////////////////////////////
   //   FSM states definition   //
   ///////////////////////////////

   parameter [1:0] STOP  = 2'b00 ;
   parameter [1:0] WRITE = 2'b01 ;
   parameter [1:0] END   = 2'b10 ;
   parameter [1:0] ZERO  = 2'b11 ;
   
   reg [1:0] STATE = ZERO ;
   reg [1:0] NEXT_STATE = ZERO ;
   
   
   
   /////////////////////////////
   //   FSM sequential part   //
   /////////////////////////////

   always @(posedge clk) begin
   
      en_counter <= en_counter + 1'b1 ;

      STATE <= NEXT_STATE ;		 
	  
   end
   
   reg test ;
   
   ////////////////////////////////
   //   FSM combinational part   //
   ////////////////////////////////

   always @(*) begin

      case(STATE)

         // default : NEXT_STATE <= STOP ;     // catch-all condition

         STOP : begin
            
            en  = 1'b0 ;
            soc = 1'b0 ;
			test = 1'b1 ;
			
			if( soc_counter == 2'd2 )
			
			   NEXT_STATE <= END ;
			
			else begin
			
               if ( load ) begin
			      
 	   
			      en_counter  <= 3'd7 ;
			      NEXT_STATE <= WRITE ;
				  
			   end // if
				  
			   else 
			      
				  NEXT_STATE <= STOP ;  
				  
	        end // else
           		   
         end

         //_________________________________________
         //

         WRITE : begin

            en  = 1'b1 ;                   
            soc = 1'b0 ;
			
            if ( en_counter == 3'd7 ) begin
			
               NEXT_STATE <= STOP ;
			   soc_counter <= soc_counter + 1'b1 ;	  		
            
            end // if
			
            else 
			
			   NEXT_STATE <= WRITE ;
				  
					
         end

         //_________________________________________
         //
     

	     END : begin
            
            en  = 1'b0 ;
            soc = 1'b1 ;
			
               NEXT_STATE <= ZERO ;	

         end
		 
		 
         //_________________________________________
         //

         ZERO : begin

            en          = 1'b0 ;                   
            soc         = 1'b0 ;
			soc_counter <= 2'd0 ;
			
            if ( tick )
               NEXT_STATE <= STOP ;
            else
               NEXT_STATE <= ZERO ;
         end
		 
		 
      endcase

   end   // always
   
   
   
   
   
   
endmodule






