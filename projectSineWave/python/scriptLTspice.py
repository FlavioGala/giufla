#
# Example Python script to automatically generate values
# for LT spice. 
#
# Giulia e Flavio
# Spring 2020
#

## open the txt file containing sine output bytes
file = open("datiLTspice.txt","r")
f = open("datiLTspice_fin.txt", "w")

##depth of the file
k = 0

##beginning
print("// let's start")

# enjoy the Python magic ...
for line in file :
    
    if k<98999 :
       l = float(line.split("              ")[0])
       t=  float(line.split("              ")[1])
    else :
       l = float(line.split("             ")[0])
       t=float(line.split("             ")[1])
    l = l*3.3    
    t=t*10**(-9)
    f.write("%.10f,%f\n" % (t,l))
    k = k + 1
    print("\n %f,%.10f" % (l,t))


##end
print("end")
print("// The code ends here")

print("\n\ndepth of the file is : \n\n" % (k))

f.close()
