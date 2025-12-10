add: PWL.c 
	clang++ -g PWL.c
	./a.out > output.txt

sub: PWL_sub.c 
	clang++ -g PWL_sub.c
	./a.out > output.txt

simulate: add_sub.sv Testbench.sv
	iverilog -g2012 add_sub.sv Testbench.sv 
	./a.out

add_sub: add_sub.sv sbdbtb.sv
	iverilog -g2012 add_sub.sv sbdbtb.sv 
	./a.out

lut_gen: lut_gen.c
	clang -g -lm lut_gen.c
	./a.out
