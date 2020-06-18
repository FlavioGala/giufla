
//////////////////////////////////////////////////////////
// This is a module to synthesize a sine wave using     //
// a dac simulation in system verilog                   //
//                                                      //
// Giulia e Flavio                                      //
// spring 2020                                          //
//////////////////////////////////////////////////////////


module Sine_dac (

   input wire clk, en,       // enable e clk a 100Mhz
   output real A_Sine_data   // Analog data sine

   ) ;


   /////////////
   //   PLL   //
   /////////////
   
   wire clk300, locked ;
   
   PLL PLL_inst (

      .clk100              (clk),
      .locked_signal    (locked),
      .clk300           (clk300)
   
      ) ;
	
	
   ////////////////
   //   IP ROM   //
   ////////////////
   
   
   //tick counter
   
   wire ticker ;
   
   TickCounter TickCounter_inst (.clk(clk300), .en(locked), .tick(ticker)) ;
   
   
   // address of the IP ROM
   
   reg [5:0] address = 6'd0 ;
   
   always @(posedge clk300) begin
   
      if (ticker == 1'b1)
	     address <= address + 1'b1 ;
		 
   end // always
	     
  
   // IP_ROM_inst
   
   wire [11:0] D_Sine_data ;   //OBS: the output of the rom is 32 bit
   
   IP_ROM IP_ROM_inst (
   
      .clk             (clk300),
	  .en              (ticker),
      .addr           (address),
	  .d_out      (D_Sine_data)    //32 bit Digital sine data
	  
	  ) ;

   
   /////////////
   //   DAC   //
   /////////////

   real digit ;       // simple way to conver a digital signal in verilog
                      // to an analog one in system verilog

   real A_out_test ; // output to introduce the enable

   DAC DAC_inst (

      .clk              (clk300),
	  .I_data      (D_Sine_data),
      .digit             (digit),	  
      .en               (ticker),
      .A_out        (A_out_test)

      ) ;
	
   //assignment to the output
   assign A_Sine_data = (en == 1'b1) ? A_out_test : 1.0 ;   //active high enable
	  

 
endmodule : Sine_dac