<<<<<<< HEAD

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
   wire tick_en = 1'b1 ;
   TickCounter #(.MAX(1000)) TickCounter_inst (.clk(clk100), .tick(ticker), .en(tick_en)) ;
   

   
   
    //////////
   // ROM  //
   //////////
   
   reg [5:0] address = 6'd0; 
   
   always @(posedge clk100) begin
   
      if (ticker) begin 
	  
	     address <= address + 1'b1 ;
		 
	  end 
   end 
   
   wire [11:0] sine_data ; 
   
   Storage Storage_inst (.clk (clk100), .en (ticker), .addr(address), .d_out(sine_data)) ;
   
   
   //////////
   // DUT  //
   //////////
   
   real D_out ;
   
   DAC #(3.3) DAC_inst (.clk(clk100), .I_data(sine_data), .en(ticker), .A_out(D_out) ) ;   
   
   
   ///////////////
   // STIMULUS  //
   ///////////////
   
   initial begin
   
   #400000 $finish ;
   
   end
   
   
   
endmodule
   
=======
>>>>>>> 9f7a00057d6e3267e1cff705205415341bb242d1
