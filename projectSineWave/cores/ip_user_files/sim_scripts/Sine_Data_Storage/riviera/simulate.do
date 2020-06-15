onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Sine_Data_Storage -L xpm -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Sine_Data_Storage xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {Sine_Data_Storage.udo}

run -all

endsim

quit -force
