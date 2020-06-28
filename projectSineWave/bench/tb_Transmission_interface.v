
//////////////////////////////////////////////////////
// A module to test Transmission interface module   //
//                                                  //
// Giulia e Flavio                                  //
// spring 2020                                      //
//////////////////////////////////////////////////////

`timescale 1ns / 100ps

module tb_Transmission_interface ;


   // CLOCK A 100 MHz
   
   wire clk100 ;
   parameter integer PERIOD = 10 ;
   
   ClockGen ClockGen_inst (.clk(clk100)) ; 
   
  
   
   



   /////////////
   //   DUT   //   
   /////////////
   
   reg          RST                = 1'b0 ;
   reg          LD_pdata ;
   wire         CS ;
   wire         NOT_LD ;
   
   Transmission_interface Transmission_interface_inst (
   
      .clk           (clk100),
	  .RST              (RST),
	  .LD_pdata    (LD_pdata),
	  .CS                (CS),
	  .NOT_LD        (NOT_LD)
   
   ) ;
   
 
 
 
 
   
   ///////////////////
   //   STIMOLOUS   //
   ///////////////////
   
   always #( 32*PERIOD ) begin
      
      #5  LD_pdata = 1'b1 ;
      #10 LD_pdata = 1'b0 ;
	  
   end // always
   
   always #(10000) begin
   
      #5  RST = 1'b1 ;
      #10 RST = 1'b0 ;
	  
   end // always
   
   initial begin
   
      #100000 $finish ;
      
   end // initial







endmodule






