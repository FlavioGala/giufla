onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Sine_Data_Storage_opt

do {wave.do}

view wave
view structure
view signals

do {Sine_Data_Storage.udo}

run -all

quit -force
