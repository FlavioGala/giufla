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
   input  wire enable,
   output wire [31:0] widthSine

   ) ;
   
   
   wire tick ;
   
   // tick counter
   TickCounter #(.MAX(1000)) tick_inst (.clk(clk), .en(enable), .tick(tick)) ;
   
   
    //count for address
   reg [5:0] addressCounter = 5'd0 ;     // 6-bit counter to cover addresses 0 to 63 

   always @(posedge clk)
      if( tick == 1'b1 )
         addressCounter <= addressCounter + 1'b1 ;   
   
   //ROM
   ROM  SineData ( .clk(clk), .address(addressCounter[5:0]), .en(tick), .data(widthSine)) ;
   

endmodule

