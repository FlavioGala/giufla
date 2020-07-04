
//////////////////////////////////////////////////////
// a module to manage the serial data transmission  //
//                                                  //
// Giulia e Flavio                                  //
// spring 2020                                      //
//////////////////////////////////////////////////////

`timescale 1ns / 100ps

module Transmission_interface (
   
   input  wire clk, tick,
   input  wire load,
   output reg  SI_en,            // for the INPUT SHIFT REGISTER
   output reg  soc               //START OF CONVERSION FOR THE DAC

   ) ;
   
   
   //a counter to state the end of conversion
   reg [2:0] en_counter  = 3'd0  ;
   
   
   ///////////////////////////////
   //   FSM states definition   //
   ///////////////////////////////

   parameter [2:0] STOP1  = 3'b000 ;
   parameter [2:0] STOP2  = 3'b001 ;
   parameter [2:0] STOP3  = 3'b010 ;
   parameter [2:0] WRITE1 = 3'b011 ;
   parameter [2:0] WRITE2 = 3'b100 ;
   parameter [2:0] SOC    = 3'b101 ;
   parameter [2:0] END    = 3'b110 ;
   
   reg [2:0] STATE = END ;
   reg [2:0] NEXT_STATE = END ;
   
   
   
   /////////////////////////////
   //   FSM sequential part   //
   /////////////////////////////
   
   always @(posedge clk) begin
      
	  STATE <= NEXT_STATE ;		  
      en_counter <= en_counter + 1'b1 ;
	  
   end // always
   

   
   ////////////////////////////////
   //   FSM combinational part   //
   ////////////////////////////////

   always @(*) begin

      case(STATE)

         default : NEXT_STATE <= END ;     // catch-all condition

         STOP1 : begin
            
            SI_en  = 1'b0 ;
            soc = 1'b0 ;
			
			
               if ( load ) begin
			      
 	              en_counter  <= 3'd7 ;
			      NEXT_STATE <= WRITE1 ;
				  
			   end // if
				  
			   else 
			      
				  NEXT_STATE <= STOP1 ;  
           		   
         end

         //_________________________________________
         //

         WRITE1 : begin
            

            SI_en  = 1'b1 ;                   
            soc = 1'b0 ;
			
			
            if ( en_counter == 3'd7 ) begin
			
               NEXT_STATE <= STOP2 ;	  		
            
            end // if
			
			
			
            else 
			
			   NEXT_STATE <= WRITE1 ;
				  
					
         end

         //_________________________________________
         //

         STOP2 : begin
		 
            
            SI_en  = 1'b0 ;
            soc = 1'b0 ;
			
			
               if ( load ) begin
			      
 	              en_counter  <= 3'd7 ;
			      NEXT_STATE <= WRITE2 ;
				  
			   end // if
				  
			   else 
			      
				  NEXT_STATE <= STOP2 ;  
           		   
         end

         //_________________________________________
         //
     

         WRITE2 : begin


            SI_en  = 1'b1 ;                   
            soc = 1'b0 ;
			
			
            if ( en_counter == 3'd7 ) begin
			
               NEXT_STATE <= STOP3 ;	  		
            
            end // if
			
						
            else 
			
			   NEXT_STATE <= WRITE2 ;
				  
					
         end

         //_________________________________________
         //
     

         STOP3 : begin
            

            SI_en  = 1'b0 ;
            soc = 1'b0 ;

			
            NEXT_STATE <= SOC ;
           		   
         end

         //_________________________________________
         //	 
	 
	     SOC : begin
            

            SI_en  = 1'b0 ;
            soc = 1'b1 ;
			
			
               NEXT_STATE <= END ;	

         end
		 
		 
         //_________________________________________
         //

         END : begin
		 

            SI_en = 1'b0 ;                   
            soc   = 1'b0 ;
			
			
            if ( tick )
			
               NEXT_STATE <= STOP1 ;
			   
            else
			
               NEXT_STATE <= END ;
			   
         end
		 
		 
      endcase

   end   // always
   
   
   
   
   
   
endmodule






