add: PWL.c 
	clang++ -g PWL.c
	./a.out > output.txt

sub: PWL_sub.c 
	clang++ -g PWL_sub.c
	./a.out > output.txt

simulate: add_sub.sv Testbench.sv
	iverilog -g2012 add_sub.sv Testbench.sv 
	./a.out
