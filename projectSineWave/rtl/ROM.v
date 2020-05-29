
`timescale 1ns / 100ps

module ROM #(parameter integer WIDTH = 64, parameter integer DEPTH = 64) (

   input  wire clk,
   input  wire en,
   input  wire [$clog2(DEPTH)-1:0] address,
   output reg [WIDTH-1:0] data

   ) ;
   
   // use a SYNTHESIS PRAGMA to infer a block RAM
   
   (* rom_style = "block" *) reg [WIDTH-1:0] mem [0:DEPTH-1] ;  // matrice
   
   // read logic
   always @(posedge clk) begin
      if(en == 1'b1) begin
	     data[WIDTH-1:0] <= mem[address][WIDTH -1:0] ;
	  end
   end

   // initial
   initial begin
   
      $readmemh("../bench/cosineNumber.txt", mem) ; 
      
	  
	  
	  
	  
   end
   
   
   
endmodule