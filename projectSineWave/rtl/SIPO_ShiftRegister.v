
///////////////////////////
// SIPO shift register   //
//                       //
// Giulia e Flavio       //
// spring 2020           //
///////////////////////////

`timescale 1ns / 100ps

module SIPO_ShiftRegister #(parameter integer N = 7, parameter [N:0] INIT = 100'hFFFFFF) (
   
   input  wire en,
   input  wire clk,
   input  wire SI,             // serial-in
   input  wire soc,         
   output wire SO,
   output reg  [N:0] PDATA


   );
   
   
   reg [N:0] q = INIT ;                 //seven flip flop's output
   
   // assign to SO the MSB
   assign SO = q[N] ;
   
   always @(posedge clk) begin
   
      if (en)
	     q[N:0] <= { q[N-1:0] , SI } ; //shift left using concatenation
	    
   end // always
   
   always @(posedge clk) begin
   
      if(soc)
	     PDATA <= q[N:0] ;      		 
	  
	  end // always 
   
endmodule