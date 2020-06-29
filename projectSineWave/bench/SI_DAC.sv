
//////////////////////////////////////////////////////
// a module to implement a serial data 12 bit dac   //
//                                                  //
// Giulia e Flavio                                  //
// spring 2020                                      //
////////////////////////////////////////////////////// 

`timescale 1ns / 100ps

module SI_DAC (

   input  wire SI,
   input  wire clk,
   input  wire soc,         // start of conversion 
   input  wire SI_en,      // beginning of the digital to analog conversion
   output real A_out

   )  ;


   
   //////////////////////////////
   //  12 BIT SHIFT-REGISTER   //
   //////////////////////////////
   
   wire [11:0] pdata ;
   wire SO ;
   
   SIPO_ShiftRegister #(.N(11)) SIPO_ShiftRegister_inst (
   
      .clk               (clk),
	  .SDI                (SI),
	  .NOT_LD            (soc),
	  .PDATA           (pdata),
	  .SO                 (SO),
	  .CS              (SI_en)
     
   ) ;
   
   
   ////////////////////
   //   DAC 12 BIT   //
   ////////////////////
   
   real digit ;
   
   DAC DAC_inst (
   
      .clk         (clk),
	  .I_data      (pdata),
	  .digit       (digit),
	  .en          (soc),          //it shoud be one clock period long
	  .A_out       (A_out)
	  
   ) ;
   
   
   
   
   
   
endmodule : SI_DAC












