
`timescale 1ns / 100ps

module SDAC (

   input wire SI,
   input wire clk,
   input wire soc,
   input wire en_SI,      // beginning of the digital to analog conversion
   output real A_out

   )  ;


   
   //////////////////////////////
   //  12 BIT SHIFT-REGISTER   //
   //////////////////////////////
   
   wire [11:0] pdata ;
   wire SO ;
   
   SIPO_ShiftRegister #(.N(11)) SIPO_ShiftRegister_inst (
   
      .clk             (clk),
	  .SI              (SI),
	  .soc             (soc),
	  .PDATA           (pdata),
	  .SO              (SO),
	  .en              (en_SI)
     
   )   ;
   
   
   ////////////////////
   //   DAC 12 BIT   //
   ////////////////////
   
   real digit ;
   
   DAC DAC_inst (
   
      .clk         (clk),
	  .I_data      (I_data),
	  .digit       (digit),
	  .en          (soc),          //it shoud be one clock period long
	  .A_out       (A_out)
	  
	  ) ;
   
   
   
   
   
   
endmodule : SDAC












