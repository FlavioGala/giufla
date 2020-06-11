#
# Example Python script to automatically generate values
# for LT spice. 
#
# Giulia e Flavio
# Spring 2020
#


from ROOT import TH1F, gStyle, gPad ;

# ## don't show the statistics pane
# gStyle.SetOptStat(0)

# ## histogram for the Sine Wave
# histoBytes = TH1F("histo", "SimpleSineWave", 256*4, -0.5, 256*4 + 0.5)   ## extra values simply goes into overflow bin

# ## **NOTE: in a ROOT histogram bin zero contains underflows, bin N+1 overflows
# bin = 1

## open the txt file containing sine output bytes
file = open("datiLTspice.txt","r")
f = open("datiLTspice_fin.txt", "w")

##depth of the file
k = 0

##beginning
print("// let's start")
print("initial begin")

# enjoy the Python magic ...
for line in file :
    
    #histoBytes.SetBinContent(bin, int(line.split("\n")[0]))
    #bin = bin + 1
    if k<98999 :
       l = float(line.split("              ")[0])
       t=float(line.split("              ")[1])
    else :
       l = float(line.split("             ")[0])
       t=float(line.split("             ")[1])
    l = l*3.3    
    t=t*10**(-9)
    f.write("%.10f,%f\n" % (t,l))
    k = k + 1
    print("\n %f,%.10f" % (l,t))

##histoBytes.Draw()

## set the correct range of the Sine Wave
##histoBytes.GetXaxis().SetRangeUser(0, 256*4)


## cosmetics
# histoBytes.GetXaxis().SetTitle("tick")
# histoBytes.GetYaxis().SetTitle("LFSR[7:0] integer value")
# histoBytes.GetYaxis().CenterTitle()

# gPad.SetGridx()
# gPad.SetGridy()


# ## set y-axis log scale for easier pattern recognition
# gPad.SetLogy()
# gPad.Modified()
# gPad.Update()

##end
print("end")
print("// The code ends here")

print("\n\nROM depth must be at least %d-slots deep.\n\n" % (k))

f.close()
