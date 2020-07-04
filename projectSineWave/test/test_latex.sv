


ciao

always  @(posedge clk) begin
if   (  en  == 1’b1  )  beginAout = 0.0  ;for  (  i =0  ;  i<= 11 ; i  =  i  + 1  )  beginreal  a  =  2.0  ;for  (  j  = 11  ;  j>i  ;  j  =  j−1 ) begina  = a*2.0  ;end  //   forassign   digit   =  Idata [ i ]  ;Aout = Aout + Vref*(digit / a)  ;end  //   forend  //   ifend  //  always