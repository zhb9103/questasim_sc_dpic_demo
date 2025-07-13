


all: clean comp sim



comp:
	# create library
	#vdel -all
	vlib work
	#compile SystemVerilog source file
	vlog +acc -work work -f filelist.fl
	# compile and link C source files
	sccom -g -DMTI_BIND_SC_MEMBER_FUNCTION main.cpp hvl_sc_top.cpp
	# sccom -g main.cpp hvl_sc_top.cpp
	sccom -link

sim:
	# start and run simulation
	vsim hdl_top hvl_sc_top -do run.do -c

clean:
	rm -rf *.ref work transcript .*.swp || TRUE

