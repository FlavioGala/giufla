
`timescale 1ns / 100ps

module tb_SI_DAC ;

   // CLOCK A 100 MHz
   
   wire clk100 ;
   
   ClockGen ClockGen_inst (.clk(clk100)) ;   
   
   
   ///////
   //DUT//
   ///////
   
   reg  SI  ;
   reg  SI_en  = 1'b1;
   reg  soc = 1'b1;
   real A_out ;
   
   SI_DAC SI_DAC_inst (
   
      .SI           (SI),
	  .clk          (clk100),
	  .SI_en        (SI_en),
	  .soc          (soc),
	  .A_out        (A_out)
	  
	  ) ;
	  
   

   ///////////////////
   //   stimulous   //   
   ///////////////////

   always #(10000) begin
      
      SI_en = $random ;	  
   
   end // always
   
   always @ ( posedge clk100 ) begin
      
      SI = $random ;	  
   
   end // always
   
      
   initial begin

       #10050 soc = 1'b0 ;
	   #20050 soc = 1'b1 ;
	   #30050 soc = 1'b0 ;
	   #40050 soc = 1'b1 ;
	   #50050 $finish ;

   end	


endmodule












