#
# Example Python script to automatically generate hex values
# for all int in a certain string. 
#
# Giulia e Flavio
# Spring 2020
#

## open the txt file containing sine output bytes
file = open("numberROM.txt","r")
f = open("numberROM.hex", "w")

##depth of the ROM
k = 0

##beginning
print("// Verilog code starts here")
print("initial begin")

## enjoy the Python magic ...
for line in file :

    l = int(line.split("\n")[0])
    l = hex(l)[2:]    
    f.write("%s\n" % l)
    k = k + 1
    print("    mem[%2d] = 8'h%s ;" % (k,l))

##end
print("end")
print("// Verilog code ends here")

print("\n\nROM depth must be at least %d-slots deep.\n\n" % (k))

f.close()
