
//
// test bench for the source code in system verilog
//

`timescale 1ns / 100ps

module tb_Sine_dac ;


   // CLOCK A 100 MHz
   
   wire clk100 ;
   
   ClockGen ClockGen_inst (.clk(clk100)) ;   


   // DUT

   reg dac_enable = 1'b1 ;
   
   real A_out ;

   Sine_dac Sine_dac_inst (

      .clk                (clk100),
	  .en             (dac_enable),
	  .A_Sine_data         (A_out)

      ) ;
   	
	
	//////////////////
	//  STIMOULUS   //
	//////////////////
	
	time t1, t2, t3, t4 ;
	
	initial begin
	
	   #70000 dac_enable = 1'b0 ; 
	   t1 = $time ; 
	   $display("\n\nA_out is = %.2f at time %.2f\n\n", A_out, t1) ;
	   
	   #30000 dac_enable = 1'b1 ;
       t2 = $time ; 
	   $display("\n\nA_out is = %.2f at time %.2f\n\n", A_out, t2) ;	   
	   
	   #30000 dac_enable = 1'b0 ;
	   t3 = $time ; 
	   $display("\n\nA_out is = %.2f at time %.2f\n\n", A_out, t3) ;
	   
	   #30000 dac_enable = 1'b1 ;
	   t4 = $time ; 
	   $display("\n\nA_out is = %.2f at time %.2f\n\n", A_out, t4) ;
	   
	   #100000 $finish ;
	   
	end   
	
	   
	   
	   
endmodule
	   
	   