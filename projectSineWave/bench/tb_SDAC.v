
`timescale 1ns / 100ps

module tb_SDAC ;

   // CLOCK A 100 MHz
   
   wire clk100 ;
   
   ClockGen ClockGen_inst (.clk(clk100)) ;   
   
   
   ///////
   //DUT//
   ///////
   
   reg  SI  ;
   reg  en  = 1'b1;
   reg  soc = 1'b1;
   real A_out ;
   
   SDAC SDAC_inst (
   
      .SI     (SI),
	  .clk    (clk100),
	  .en     (en),
	  .soc    (soc),
	  .A_out  (A_out)
	  
	  ) ;
	  
   

   ///////////////////
   //   stimulous   //   
   ///////////////////

   always @(posedge clk100) begin
      
      SI = $random ;	  
   
   end // always
   
   
	initial begin

       #10000 soc = 1'b0 ;
	   #20000 soc = 1'b1 ;
	   #30000 soc = 1'b0 ;
	   #40000 soc = 1'b1 ;
	   #50000 $finish ;

   end	


endmodule












