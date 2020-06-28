
`timescale 1ns / 100ps

module tb_SI_DAC ;

   // CLOCK A 100 MHz
   
   wire clk100 ;
   
   ClockGen ClockGen_inst (.clk(clk100)) ;   
   
   
   ///////
   //DUT//
   ///////
   
   reg  SDI  ;
   reg  CS  = 1'b0;
   reg  LD  = 1'b0;
   real A_out ;
   wire [11:0] I_data = SI_DAC_inst.pdata ;
   
   SI_DAC SI_DAC_inst (
   
      .SI           (SDI),
	  .clk          (clk100),
	  .SI_en        (CS),
	  .soc          (LD),
	  .A_out        (A_out)
	  
	  ) ;
	  
   parameter integer PERIOD = 10 ;  
   integer  i ;
   integer  j ;
   real     Aout_expected = 0.0 ;
   real     Vref = 5.0 ;
   real     digit ;
   

   ///////////////////
   //   stimulus   //   
   ///////////////////

   always #(10000) begin
      
      CS = $random ;	  
   
   end // always
   
   always @ ( posedge clk100 ) begin

      SDI = $random ;	  
   
   end // always
   
   always #(10005) begin
      
      LD = 1'b1 ;
      
      #10 LD = 1'b0	; 
   
   end // always
   
   always @( posedge LD ) begin
  
      Aout_expected = 0.0 ;
  
      for ( i = 0 ; i <= 11 ; i = i + 1 ) begin  
       
         real a = 2.0 ;
             
         for ( j = 11 ; j > i ; j = j - 1 ) begin
         
            a = a*2.0 ;
			
         end // for
		
         assign digit = I_data[i] ;
		   
         Aout_expected = Aout_expected + Vref*(digit/a) ;
	
      end // for
  
      $display ( "\n\n D_out should be : %f V at time %d ns \n\n" ,  Aout_expected , $time ) ;
  
   end // always
   
   initial begin
   
      #100000 $finish ;
	  
   end // initial


endmodule












