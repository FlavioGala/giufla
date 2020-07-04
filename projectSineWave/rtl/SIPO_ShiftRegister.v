
///////////////////////////
// SIPO shift register   //
//                       //
// Giulia e Flavio       //
// spring 2020           //
///////////////////////////

`timescale 1ns / 100ps

module SIPO_ShiftRegister #(parameter integer N = 7, parameter [N:0] INIT = 100'hFFFFFF) (
   
   input  wire CS,
   input  wire clk,
   input  wire SDI,                   // serial-in
   input  wire NOT_LD,         
   output wire SO,
   output reg  [N:0] PDATA


   );
   
   
   reg [N:0] q = INIT ;                 
   
   assign SO = q[N] ;             
   
   always @(posedge clk) begin
   
      if (CS)
	     q[N:0] <= { q[N-1:0] , SDI } ; 
		 
   end // always
   
   always @(posedge clk) begin
   
      if(NOT_LD)
	     PDATA <= q[N:0] ;      		 
	  
   end // always 
   
endmodule