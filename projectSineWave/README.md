# sine wave gerator program (by giulia e flavio)

```

1) UPLOAD THE SINE DATA ON A ROM, OR ON A FIFO AND SIMULATE

2) ASSIGN THOSE VALUE TO THE WIDTH OF A PWM AND SIMULATE

3) CREATE THE PWM WITH THE RIGHT WIDTH AND SIMULATE

4) FIND A WAY TO VISUALIZE IT AS A REAL SINE WAVE 

```

# flavio first ideas

1) generare dati per il seno un po a caso
1.1) usare le loock up tables per metterli piu a posto
2) importarli e salvarli nella ram
3) creare il pulse width modulation con i dati della ram
4) cercare di visualizzare il seno
5)utilizzare il delay dell'fpga per sfasare il seno
6) fare una somma di due seni?


# third day ideas

istanziare un contatore per leggere i dati


# consigli di pacher

1) altro modo di generare il seno: con la DAC (implementare una dac e convertire il segnale che esce dalla rom)
2)lt spice per circuito RC e OP AMP ($fwrite $fmonitor $fdisplay)
3)ROM con IP block
4) confronto fra ROM nel blocco di RAM e ROM distribuita nelle lut e nei flip flop e confronto


#programma da adesso
1) risolvere il problema del tick counter
2) risolvere il problema del file.hex
3) mandare l'uscita nel circuito R C di LTspice
4)inserire una PLL
5) instanziare la ROM come una IP

6)seno creato con la DAC
7)prendere la FPGA da pacher con OPamp e R C e visualizzare il seno.
8)pragma con la ROM nelle LUT.

TOTALE 20 ore






