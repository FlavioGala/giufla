
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

      .clk_in1              (clk),
      .locked            (locked),
      .clk_out1          (clk300)
   
      ) ;
	
   
   //////////////////
   // tick counter //
   //////////////////
   
   wire tick ;
   
   TickCounter TickCounter_inst (.clk(clk300), .en(locked), .tick(tick)) ;
   



   ///////////////////////
   // ROM MAPPING INST  //
   ///////////////////////
   
   wire [31:0] widthSine ; 
   wire SI ;
   wire soc ;
   wire SI_en ;
   
   ROM_mapping ROM_mapping_inst (

      .clk                    (clk300),
      .tick                   (tick),
      .widthSine              (widthSine),
	  .SO                     (SI),
	  .SI_en                  (SI_en),
	  .soc                    (soc)

   ) ;
   


   
   /////////////
   //   DAC   //
   /////////////


   real A_out_test ;                         // output to introduce the enable

   
   SI_DAC SI_DAC_inst (

      .clk              (clk300),
	  .SI               (SI),
      .soc              (soc),	  
      .SI_en            (SI_en),
      .A_out            (A_out_test)

      ) ;
	  
	  
	
   //conditional assignment to the output
   assign A_Sine_data = (en == 1'b1) ? A_out_test : 1.0 ;   //active high enable
	  

 
endmodule : Sine_dac



