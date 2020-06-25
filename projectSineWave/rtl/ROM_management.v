
/////////////////////////////////////////////////////////////////
// a module to configure the output bus of a rom in a serial   //
// data 1 byte packed                                          //
//                                                             //
// Giulia e Flavio                                             //
// spring 2020                                                 //
/////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module ROM_management (

   input wire [31:0] Data_bus,
   input wire clk, tick,
   
   output reg SO, 
   output reg load

   ) ;
   
   
   /////////////////////////
   // Shift register inst //
   /////////////////////////
   
   reg  Load ;
   reg  [7:0] pdata ;
   reg  [4:0] ShiftCounter = 5'd0 ; // counter to shift the input data to the last eight bits of the ROM data
   
   ShiftRegister ShiftRegister_inst (.clk(clk), .SI(1'b1), .LOAD(Load), .PDATA(pdata), .SO(SO)) ;
   
   
   
   // SHIFT COUNTER
   
   always @(posedge clk) begin
   
      if (tick)
	  
	     ShiftCounter <= 5'd0 ;
		 
	  else
	  
         ShiftCounter <= ShiftCounter + 1'b1 ;
	  
   end // always
   
   
   
   // PDATA
   
   always @(posedge clk) begin
   
      if ( ShiftCounter < 5'd16 )
	  
	     pdata <= Data_bus [15:8] ;
		 
	  else 
	     
		 pdata <= Data_bus [7:0] ;       
		 
   end // always
   
   
   
   // LOAD

   always @(posedge clk) begin

      if (ShiftCounter == 5'd4 | ShiftCounter == 5'd20) begin
	  
	     Load = 1'b1 ;
		 load = Load ;
		 
	  end // if
		 
	  else begin
	  
	     Load = 1'b0 ;
		 load = Load ;
		 
	  end // else
      
   end // always
   

   
endmodule




