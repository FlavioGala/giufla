
`timescale 1ns/100ps

module IP_ROM (
   input wire clk,
   input wire en,
   input wire [5:0] addr,
   output wire [31:0] d_out
);

Sine_Data_Storage Sine_Data_Storage_inst (
   
   
	.clka           (clk),
    
    .ena            (en),
   
    .addra          (addr),
   
    .douta          (d_out)
	
);




endmodule 