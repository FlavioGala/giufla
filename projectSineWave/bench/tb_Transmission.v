
`timescale 1ns / 100ps

module tb_Transmission ;


   // CLOCK A 100 MHz
   
   wire clk100 ;
   
   ClockGen ClockGen_inst (.clk(clk100)) ; 
   
   
   /////////////////////
   //   tickCounter   //
   /////////////////////
   
   wire tick_enable = 1'b1 ;
   wire tick ;
   
   TickCounter TickCounter_inst (.clk(clk100), .tick(tick), .en(tick_enable)) ;
   

   /////////////
   //   DUT   //   
   /////////////
   
   
   reg load ;
   reg [4:0] loadCounter = 5'd0 ;
   
   always @(posedge clk100) begin
      
	  if ( loadCounter == 5'd31 ) begin
	     load <= 1'b1 ;
		 loadCounter <= 5'd0 ;
	  end // if
		 
	  else begin
	     load <= 1'b0 ;
	     loadCounter <= loadCounter +1'b1 ;
      end // else
	  
   end // always
   
   
   
   wire en ;
   wire soc ;
   
   Transmission Transmission_inst (
   
      .clk     (clk100),
	  .tick    (tick),
	  .load    (load),
	  .en      (en),
	  .soc     (soc)
   
   ) ;
   
   
   
   wire test = Transmission_inst.test ;
   wire [1:0] socCounter = Transmission.soc_counter ;
   
   
   ///////////////////
   //   STIMOLOUS   //
   ///////////////////
   
   initial begin
   
         #100000 $finish ;
      
   end // initial







endmodule






