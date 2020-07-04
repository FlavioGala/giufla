

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

   
  
   
   ///////////////////
   //     DUT       //
   ///////////////////
   
   reg RST = 1'b0;
   wire SO ;
   reg [31:0] data_bus ;
   
   wire LD_pdata ;
   wire [7:0] pdata = ROM_management.pdata ;
   //wire [4:0] ShiftCounter = ROM_management.ShiftCounter ; 
   
   ROM_management ROM_management_inst (.clk(clk100), .tick(RST), .SO(SO), .Data_bus(data_bus), .load(LD_pdata)) ;



   ////////////////
   // STIMULUS  //
   ////////////////
   
   always #(20500) begin
   
      data_bus = $random ;
      #1005 RST = 1'b1 ;
      #10 RST = 1'b0 ;
	  
   end // always
   
   initial begin
      
      #100000 $finish ;
	    
   end // initial
   
   
   


endmodule










