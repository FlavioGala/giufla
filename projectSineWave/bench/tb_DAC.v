
//
// test bench only for the DAC
//

`timescale 1ns / 100 ps

module tb_DAC ;


   // CLOCK A 100 MHz
   wire clk100 ;
   
   ClockGen ClockGen_inst (.clk(clk100)) ;
   
   // tickCounter
   wire ticker ;
   
   TickCounter tick_inst (.clk(clk100), .tick(ticker)) ;
   
   //Input data
   wire [7:0] I_data1 = 8'b11111111 ; 
   
   //wire [31:0] I_data2 = 8'h00000007 ;

   
   //////////
   // DUT  //
   //////////
   
   real D_out ;
   
   DAC #(3.3) DAC_inst (.clk(clk100), .I_data(I_data1), .A_out(D_out), .en(ticker)) ;
   
   
   ///////////////
   // STIMULUS  //
   ///////////////
   
   initial begin
   
   #1000 $finish ;
   
   end
   
   
   
endmodule
   