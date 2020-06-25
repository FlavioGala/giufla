

/////////////////////////////////////////////////////
// a module to manage map the output of the rom on // 
// the FPGA chip                                   //
//                                                 //
// by giulia e flavio                              //
// spring 2020                                     //
/////////////////////////////////////////////////////



`timescale 1ns / 100ps

module ROM_mapping (

   input  wire clk, tick,
   
   output wire [31:0] widthSine,
   output reg  SO,
   output wire SI_en,
   output wire soc 
   
   ) ;
   

   
   // COUNTER FOR THE ADDRESS
   
   reg [5:0] addressCounter = 5'd0 ;     // 6-bit counter to cover addresses 0 to 63 

   always @(posedge clk)
      if( tick == 1'b1 )
         addressCounter <= addressCounter + 1'b1 ;   
		 
		 
   
   //ROM istanziata da noi
   //ROM  ROM_inst ( .clk(clk), .address(addressCounter[5:0]), .en(tick), .data(widthSine)) ;
   
   
   //IP ROM
   IP_ROM IP_ROM_inst ( .clk(clk), .addr(addressCounter[5:0]), .en(tick), .d_out(widthSine)) ;
  
   
   
   // DATA ROM MANAGEMENT
   
   wire load ;
   
   ROM_management ROM_management_inst (.clk(clk), .Data_bus(widthSine), .SO(SO), .tick(tick), .load(load)) ;
   
   
   
   // TRANSMISSION INST 
   Transmission_interface Transmission_interface_inst (.clk(clk), .load(load), .SI_en(SI_en), .tick(tick), .soc(soc)) ;
   
   

endmodule












