
///////////////////////////
// PISO shift register   //
//                       //
// Giulia e Flavio       //
// spring 2020           //
///////////////////////////

`timescale 1ns / 100ps

module ShiftRegister #(parameter integer N = 7, parameter [N:0] INIT = 100'hFFFFFF) (
   
   input  wire clk,
   input  wire SI,             // serial-in
   input  wire LOAD,           // load 1/ shift 0
   input  wire [N:0] PDATA,
   output wire SO



   );
   
   
   reg [N:0] q = INIT ;                 //seven flip flop's output
   
   // assign to SO the MSB
   assign SO = q[N] ;
   
   always @(posedge clk) begin
   
      if (LOAD)
	     q[N:0] <= PDATA[N:0] ;
	  
	  else begin
	     
         q[N:0] <= { q[N-1:0] , SI } ;      //shift left using concatenation		 
	  
	  end // else
	     
   end // always
   
   
endmodule