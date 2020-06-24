/////////////////////////////////////////////////////
// width of pwm modulation with a sine wave input  //
//                                                 //
// by giulia e flavio                              //
//                                                 //
//1/06/2020                                        //
/////////////////////////////////////////////////////



`timescale 1ns / 100ps

module WidthSine (

   input  wire clk,
   input  wire tick_enable,
   
   output wire [31:0] widthSine,
   output reg SO,
   output wire SI_en,
   output wire soc 
   
   ) ;
   
   
   wire tick ;
   
   // tick counter
   TickCounter #(.MAX(1000)) tick_inst (.clk(clk), .en(tick_enable), .tick(tick)) ;
   
   
    //count for address
   reg [5:0] addressCounter = 5'd0 ;     // 6-bit counter to cover addresses 0 to 63 

   always @(posedge clk)
      if( tick == 1'b1 )
         addressCounter <= addressCounter + 1'b1 ;   
   
   
   /////////////
   //   ROM   //
   /////////////
   
   //ROM istanziata da noi
   //ROM  ROM_inst ( .clk(clk), .address(addressCounter[5:0]), .en(tick), .data(widthSine)) ;
   
   //IP ROM
   IP_ROM IP_ROM_inst ( .clk(clk), .addr(addressCounter[5:0]), .en(tick), .d_out(widthSine)) ;
   
   
   
   
   ////////////////////
   // Shift register //
   ////////////////////
   
   reg        load ;
   reg  [7:0] pdata ;
   reg  [4:0] ShiftCounter = 5'd0 ; // counter to shift the input data to the last eight bits of the ROM data
   
   ShiftRegister ShiftRegister_inst (.clk(clk), .SI(1'b1), .LOAD(load), .PDATA(pdata), .SO(SO)) ;
   
   
   
   // always
   always @(posedge clk) begin
   
      if ( ShiftCounter < 5'd16 )
	     pdata <= widthSine [15:8] ;
		 
	  else 
	     pdata <= widthSine [7:0] ;
      
	  ShiftCounter <= ShiftCounter + 1'b1 ;
		 
  end // always

   always @(*) begin

      if (ShiftCounter == 5'd2 | ShiftCounter == 5'd18)
	     load = 1'b1 ;
		 
	  else 
	     load = 1'b0 ;
      
   end // always
   
   
   // TRANSMISSION INST //
   Transmission Transmission_inst (.clk(clk), .load(load), .en(en), .tick(tick), .soc(soc)) ;
   
   

endmodule












