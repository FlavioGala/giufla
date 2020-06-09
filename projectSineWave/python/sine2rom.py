#
# Example Python script to automatically generate hex values
# for all int in a certain string. 
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

# ## open the txt file containing sine output bytes
# file = open("numberROM.txt","r")
# f = open("numberROM.hex", "w")

# ##depth of the ROM
# k = 0

# ##beginning
# print("// Verilog code starts here")
# print("initial begin")

# ## enjoy the Python magic ...
# for line in file :
    
    # histoBytes.SetBinContent(bin, int(line.split("\n")[0]))
    # bin = bin + 1
    # l = int(line.split("\n")[0])
    # l = hex(l)[2:]    
    # f.write("%s\n" % l)
    # k = k + 1
    # print("    mem[%2d] = 8'h%s ;" % (k,l))

# histoBytes.Draw()

# ## set the correct range of the Sine Wave
# histoBytes.GetXaxis().SetRangeUser(0, 256*4)


# ## cosmetics
# histoBytes.GetXaxis().SetTitle("tick")
# histoBytes.GetYaxis().SetTitle("LFSR[7:0] integer value")
# histoBytes.GetYaxis().CenterTitle()

# gPad.SetGridx()
# gPad.SetGridy()


# ## set y-axis log scale for easier pattern recognition
# gPad.SetLogy()
# gPad.Modified()
# gPad.Update()

# ##end
# print("end")
# print("// Verilog code ends here")

# print("\n\nROM depth must be at least %d-slots deep.\n\n" % (k))

# f.close()
