

/////////////////////////////////////////////////////
// a test bench module to test the ROM management  //
//                                                 //
// Giulia e Flavio                                 //
// spring 2020                                     //
/////////////////////////////////////////////////////


`timescale 1ns / 100ps

module tb_ROM_management ;



   /////////////////////////////////
   //   100 MHz clock generator   //
   /////////////////////////////////

   wire clk100 ;

   ClockGen ClockGen_inst (.clk(clk100)) ;



   //////////////////
   // TICK COUNTER //
   //////////////////
   
   reg tick ;
   reg [31:0] tickCounter = 32'd0 ;
   parameter integer MAX  = 1000 ;
   
   always @(posedge clk100) begin
      
	  if ( tickCounter == MAX ) begin
	     
		 tick = 1'b1 ;
		 tickCounter <= 32'd0 ;
		 
	  end // if
		 
      else begin
	     
		 tick = 1'b0 ;
	     tickCounter <= tickCounter + 1'b1 ;
   
      end // else 

   end // always	  
   
   
   
   ///////////////////
   //     DUT       //
   ///////////////////
   
   wire SO ;
   reg [31:0] Data_bus ;
   
   wire load = ROM_management.load ;
   wire [7:0] pdata = ROM_management.pdata ;
   wire [4:0] ShiftCounter = ROM_management.ShiftCounter ; 
   
   ROM_management ROM_management_inst (.clk(clk100), .tick(tick), .SO(SO), .Data_bus(Data_bus)) ;



   ////////////////
   // STIMOLOUS  //
   ////////////////
   
   always #(20000) begin
   
      Data_bus = $random ;
	  
   end // always
   
   
   initial begin
   
      #100000 $finish ;
	    
   end // initial
   
   
   


endmodule










