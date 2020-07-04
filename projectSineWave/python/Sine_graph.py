
#
# pyROOT script to plot the analog sine wave 
# that come out from a DAC
#
# Giulia e Flavio 
# Spring 2020
#


from ROOT import TH1F, gStyle, gPad, TGraph, TCanvas, gROOT;
from array import array

## don't show the statistics pane
gStyle.SetOptStat(0)


## plot of the sine wave
Sine_plot = TH1F("Sine_Plot", "Sine from DAC hystogram", 256*4, -0.5, 256*4 + 0.5)   ## extra values simply goes into overflow bin


## open the ASCII file
file = open("Dac_data.txt","r")

k = 0
V = 0
x, y = array( 'd' ), array( 'd' )

## bin declaration
bin = 1


for line in file :

    V = float(line.split("              ")[0])
    x.append(float(line.split("              ")[1]))
    y.append(float(line.split("              ")[0]))
    Sine_plot.SetBinContent(bin, V)
    bin = bin + 1
    k = k + 1


## HYSTOGRAM

Sine_plot.Draw()

Sine_plot.GetXaxis().SetRangeUser(50, 150)
Sine_plot.GetYaxis().SetRangeUser(-5, 5)


## cosmetics
Sine_plot.GetXaxis().SetTitle("number of convertion")
Sine_plot.GetYaxis().SetTitle("V [V]")
#Sine_plot.GetYaxis().CenterTitle()

gPad.SetGridx()
gPad.SetGridy()



## GRAPH

Sine_canvas = TCanvas("Sine_graph","Sine_graph",200,10,600,400);
Sine_graph  = TGraph(k,x,y);

## cosmetics
Sine_graph.SetTitle( 'Sine from DAC graph' )
Sine_graph.GetXaxis().SetTitle( 't [ns]' )
Sine_graph.GetYaxis().SetTitle( 'V [V]' )
Sine_graph.GetXaxis().SetRangeUser(400000, 800000)
Sine_graph.GetYaxis().SetRangeUser(-5, 5)

Sine_graph.Draw("APC");




