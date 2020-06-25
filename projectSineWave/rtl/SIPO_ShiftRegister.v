
///////////////////////////
// SIPO shift register   //
//                       //
// Giulia e Flavio       //
// spring 2020           //
///////////////////////////

`timescale 1ns / 100ps

module SIPO_ShiftRegister #(parameter integer N = 7, parameter [N:0] INIT = 100'hFFFFFF) (
   
   input  wire SI_en,
   input  wire clk,
   input  wire SI,                   // serial-in
   input  wire soc,         
   output wire SO,
   output reg  [N:0] PDATA


   );
   
   
   reg [N:0] q = INIT ;                 
   
   assign SO = q[N] ;              // assign to SO the MSB
   
   always @(posedge clk) begin
   
      if (SI_en)
	     q[N:0] <= { q[N-1:0] , SI } ; 
		 
   end // always
   
   always @(posedge clk) begin
   
      if(soc)
	     PDATA <= q[N:0] ;      		 
	  
   end // always 
   
endmodule