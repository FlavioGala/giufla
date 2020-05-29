
`timescale 1ns / 100ps

module PWM (

   input  wire  clk,
   input  wire  [63:0] width,
   output wire  pwm

   ) ;
   
   reg [7:0] count = 8'h00 ;
   
   always @(posedge clk) begin
   
      count <= count + 1'b1 ;   
   
   end
   
   // assert PWM signal
   assign pwm = ( count[7:0] < width[7:0] ) ? 1'b1 : 1'b0 ;  // binary comparator
   
endmodule