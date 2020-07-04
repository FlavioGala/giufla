
//////////////////////////////////////////////////////
// a module to manage the serial data transmission  //
//                                                  //
// Giulia e Flavio                                  //
// spring 2020                                      //
//////////////////////////////////////////////////////

`timescale 1ns / 100ps

module Transmission_interface (
   
   input  wire clk, 
   input  wire RST,                 // it will be the tick
   input  wire LD_pdata,
   output reg  CS,                  // for the INPUT SHIFT REGISTER
   output reg  NOT_LD               //actually it is NOT LD

   ) ;
   
   
   //a counter to state the end of conversion
   reg [2:0] en_counter    = 3'd0  ;
   
   
   ///////////////////////////////
   //   FSM states definition   //
   ///////////////////////////////

   parameter [2:0] STOP1   = 3'b000 ;
   parameter [2:0] STOP2   = 3'b001 ;
   parameter [2:0] STOP3   = 3'b010 ;
   parameter [2:0] WRITE1  = 3'b011 ;
   parameter [2:0] WRITE2  = 3'b100 ;
   parameter [2:0] SOC     = 3'b101 ;
   parameter [2:0] END     = 3'b110 ;
   
   reg [2:0] STATE         = END ;
   reg [2:0] NEXT_STATE    = END ;
   
   
   
   /////////////////////////////
   //   FSM sequential part   //
   /////////////////////////////
   
   always @(posedge clk) begin
      
	  STATE       <= NEXT_STATE ;		  
      en_counter  <= en_counter + 1'b1 ;
	  
   end // always
   

   
   ////////////////////////////////
   //   FSM combinatory part   //
   ////////////////////////////////

   always @(*) begin

      case(STATE)

         default : NEXT_STATE <= END ;     

         STOP1 : begin
            
            CS      = 1'b0 ;
            NOT_LD  = 1'b0 ;
			
            if ( LD_pdata ) begin
			      
               en_counter  <= 3'd7 ;
               NEXT_STATE  <= WRITE1 ;
				  
            end // if
				  
            else 
			      
               NEXT_STATE <= STOP1 ;  
           		   
         end
         //_________________________________________
         //
         WRITE1 : begin
            
            CS      = 1'b1 ;                   
            NOT_LD  = 1'b0 ;
			
            if ( en_counter == 3'd7 ) begin
			
               NEXT_STATE <= STOP2 ;	  		
            
            end // if
			
            else 
			
			   NEXT_STATE <= WRITE1 ;
				  
         end
         //_________________________________________
         //
         STOP2 : begin
		 
            
            CS      = 1'b0 ;
            NOT_LD  = 1'b0 ;
			
               if ( LD_pdata ) begin
			      
                  en_counter  <= 3'd7 ;
			      NEXT_STATE <= WRITE2 ;
				  
               end // if
				  
               else 
			      
                  NEXT_STATE <= STOP2 ;  
           		   
         end
         //_________________________________________
         //
         WRITE2 : begin

            CS      = 1'b1 ;                   
            NOT_LD  = 1'b0 ;
			
            if ( en_counter == 3'd7 ) begin
			
               NEXT_STATE <= STOP3 ;	  		
            
            end // if
						
            else 
			
               NEXT_STATE <= WRITE2 ;
					
         end
         //_________________________________________
         //
         STOP3 : begin

            CS      = 1'b0 ;
            NOT_LD  = 1'b0 ;

            NEXT_STATE <= SOC ;
           		   
         end
         //_________________________________________
         //	 
	     SOC : begin
            
            CS      = 1'b0 ;
            NOT_LD  = 1'b1 ;
			
               NEXT_STATE <= END ;	

         end
         //_________________________________________
         //
         END : begin

            CS      = 1'b0 ;                   
            NOT_LD  = 1'b0 ;
			
            if ( RST )
			
               NEXT_STATE <= STOP1 ;
			   
            else
			
               NEXT_STATE <= END ;
			   
         end
		 
      endcase

   end   // always
   
   
   
   
   
   
endmodule






