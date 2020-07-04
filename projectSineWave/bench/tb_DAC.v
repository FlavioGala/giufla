//
// test bench only for the DAC
//

`timescale 1ns / 100ps

module tb_DAC ;


   // CLOCK A 100 MHz
   
   wire clk100 ;
   
   ClockGen ClockGen_inst (.clk(clk100)) ;   
   
   
   
   //////////
   // DUT  //
   //////////
       
   //wire [11:0] I_data_1 = 12'd1000 ;
   //wire [11:0] I_data_2 = 12'd4000 ; //this is near the full scale of a 12 bit DAC
   //wire [11:0] I_data_3 = 12'd500 ;
   
   reg  [11:0] I_data ; 
   reg  soc = 1'b0 ;   
   real D_out ;
   
   
   
   // dac 12 bit
   
   DAC #(5.0) DAC_inst (.clk(clk100), .I_data(I_data), .en(soc), .A_out(D_out) ) ;   
   
   
   
   
   
   
   ///////////////
   // STIMULUS  //
   ///////////////
   
   
   
   
   // FIRST STIMOLOUS
   
   integer  i ;
   integer  j ;
   real     k = 0.0 ;
   real     Vref = 3.3 ;
   real     digit ;
      
   always #(10000) begin
   
      I_data = $random ;
	  
	  k = 0.0 ;
	  
	  for ( i=0 ; i <= 11 ; i = i + 1 ) begin  
		  
        real a = 2.0 ;
			   
	    for ( j = 11 ; j > i ; j = j - 1 ) begin
			 
		   a = a*2.0 ;
				
		end // for
			
        assign digit = I_data[i] ;
			   
		k = k + Vref*(digit/a) ;
		
      end // for
	  
	  $display ( "\n\n D_out should be : %f V at time %f ns \n\n" ,  k , $time ) ;
	  
	  
   end // always
   
   
   
   
   // SECOND STIMOLOUS
   
   initial begin
   
      #10000              soc = 1'b0 ;
	  
	  @(posedge clk100)   soc = 1'b1;
	  
	  @(posedge clk100)   soc = 1'b0;
	  
	  #10000              soc = 1'b0 ;
	  
	  @(posedge clk100)   soc = 1'b1;
	  
	  @(posedge clk100)   soc = 1'b0;
	  
	  #10000              soc = 1'b0 ;
	  
	  @(posedge clk100)   soc = 1'b1;
	  
	  @(posedge clk100)   soc = 1'b0;
	  
	  #10000              soc = 1'b0 ;
	  
	  @(posedge clk100)   soc = 1'b1;
	  
	  @(posedge clk100)   soc = 1'b0;
   
      #10000 $finish ;
   
   end
   
   
   
endmodule


