`timescale 1ns / 100ps

module tb_TickCounter;

wire clk100 ;

   ClockGen   ClockGen_inst (.clk(clk100)) ;
   
  wire ticker; 
   
TickCounter #(1000) DUT (.clk (clk100), .tick (ticker)) ;

 initial begin

      #(2*64*1000) $finish ;
   end










endmodule 