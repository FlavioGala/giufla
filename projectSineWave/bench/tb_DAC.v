<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> ecb79be6b3ebd8bbfa06bbe706ba171ebeea3f1f

//
// test bench only for the DAC
//

`timescale 1ns / 100ps

module tb_DAC ;


   // CLOCK A 100 MHz
   
   wire clk100 ;
   
   ClockGen ClockGen_inst (.clk(clk100)) ;    
   
   // tickcounter
   
   wire ticker;
   wire enable = 1'b1 ;
   
   TickCounter TickCounter_inst (.clk(clk100), .en(enable), .tick(ticker)) ;
   
   
   //////////
   // DUT  //
   //////////
   
   // input data
   
   //wire [11:0] I_data_1 = 12'd1000 ;
   wire [11:0] I_data_2 = 12'd4000 ; //this is near the full scale of a 12 bit DAC
   //wire [11:0] I_data_3 = 12'd500 ;
   
   //output data
   
   real D_out ;
   
   // dac 12 bit
   
   DAC #(3.3) DAC_inst (.clk(clk100), .I_data(I_data_2), .en(ticker), .A_out(D_out) ) ;   
   
   
   ///////////////
   // STIMULUS  //
   ///////////////
   
   initial begin
   
   #400000 $finish ;
   
   end
   
   
   
endmodule
<<<<<<< HEAD

=======
   
=======
>>>>>>> 9f7a00057d6e3267e1cff705205415341bb242d1
>>>>>>> ecb79be6b3ebd8bbfa06bbe706ba171ebeea3f1f
