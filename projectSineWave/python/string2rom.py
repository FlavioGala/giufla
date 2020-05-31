#
# Example Python script to automatically generate ASCII hex values
# for all characters in a certain string. 
#
# Luca Pacher - pacher@to.infn.it
# Spring 2020
#

## open the ASCII file containing shift-register output bytes
file = open("numberROM.txt","r")

l = 0
k = 0


## enjoy the Python magic ...
for x in file :

	#histoBytes.SetBinContent(bin, int(line.split("\n")[0]))
	
    #bin = bin + 1

    l = hex([int(x) for x in next(x).split()])[2:]  
        
    f = open("numberROM.hex", "w")    
    f.write("%s\n" % l)
    k = k + 1
    print("   mem[%2d] = 8'h%s ;" % (k,l))


print("// Verilog code starts here")
print("initial begin")

#for c in message :
#	k = k + 1
#	hexCode = hex(ord(c))[2:]
#	
#	print("   mem[%2d] = 8'h%s ;" % (k,hexCode))

print("end")
print("// Verilog code ends here")


print("\n\nROM depth must be at least %d-slots deep.\n\n" % (k))

f.close()
