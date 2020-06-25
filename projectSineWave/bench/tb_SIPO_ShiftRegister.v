
/////////////////////////////////////////////////////////////////////////////
// a module to test the behaviour of the implemented SIPO shift register   //
//                                                                         //
// Giulia e Flavio                                                         //
// spring 2020                                                             //
/////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module tb_SIPO_ShiftRegister ;



   
   ////////////////////
   // 100 MHz CLOCK  //
   ////////////////////

   wire clk100 ;
   
   ClockGen ClockGen_inst (.clk(clk100)) ;
   
   
   
   
   /////////////
   //   DUT   //
   /////////////
   
   reg   SI_en       = 1'b0 ; 
   reg   SI          = 1'b0 ; 
   reg   soc         = 1'b0 ;
   reg   soc_counter = 1'b0 ;
   wire  SO ;
   wire  [11:0] PDATA ;
   
   SIPO_ShiftRegister #(.N(11) , .INIT(12'hFFF)) SIPO_ShiftRegister_inst (
   
      .clk                 (clk100),
      .SI_en                (SI_en),
      .SI                      (SI),
	  .soc                    (soc),
	  .SO                      (SO),
	  .PDATA                (PDATA)
 
   ) ;




   ///////////////////
   //   STIMOLOUS   //
   ///////////////////
   
   

   always @(posedge clk100)
   
      SI = $random ;
	  
	  
	  
   initial begin
   
      #11000 SI_en = 1'b1 ;
	  #11000 SI_en = 1'b0 ;
	  #16000 SI_en = 1'b1 ;
      #11000 SI_en = 1'b0 ;
	  #11000 SI_en = 1'b1 ;
	  #16000 SI_en = 1'b0 ;
	  #11000 $finish ;
	  
   end // initial
	  
	  
	  
   always #(10005) begin
   
      soc = 1'b1 ;
		  
	  #10 soc = 1'b0 ;
	  
   end // always
	  
	  
	  

endmodule









