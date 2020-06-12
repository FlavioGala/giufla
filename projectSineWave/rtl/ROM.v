
`timescale 1ns / 100ps

module ROM #(parameter integer WIDTH = 32, parameter integer DEPTH = 64) (

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
   
<<<<<<< HEAD
      $readmemh("C:\\Users\\Garripoli\\Desktop\\giufla\\projectSineWave\\rtl\\NumberROM.hex", mem) ; 
=======
      //$readmemh("../../rtl/numberROM.hex", mem) ; 
>>>>>>> 34be4cd16e8945a160df072cb5efc6deb6d39f65
      
	  //$readmemh("../../rtl/numberROM.txt", mem);
	  
	  $readmemh("C:/Users/giuli/Desktop/giufla/projectSineWave/rtl/numberROM.txt", mem);
	  
	  
	  
   end
   
   
   
endmodule