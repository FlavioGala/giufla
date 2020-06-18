`timescale 1ns / 100ps


module tb_Storage;

/////////////////////////////////
   //   100 MHz clock generator   //
   /////////////////////////////////

   wire clk100 ;

   ClockGen ClockGen_inst (.clk(clk100)) ;

      ///////////////////
   //     DUT       //
   ///////////////////
   
   wire [31:0] out  ;
   
   
   reg [5:0] address = 6'd0; 
   
   always @(posedge clk100) begin
   
      if (tick) begin 
	  
	     address <= address + 1'b1 ;
		 
	  end 
   end 
   
   
   wire tick ;
   wire en = 1'b1 ;
   
   TickCounter tick_inst ( .clk (clk100), .en (en), .tick (tick));
   
   
   Storage Storage_inst (.clk(clk100) ,.en(tick) ,.addr(address), .d_out(out));
  
    ///////////////////////
   //    stimulous     //
   //////////////////////
   
   initial begin

   
    #(2*650000) $finish ;
	
	end
	
	
	
	endmodule 