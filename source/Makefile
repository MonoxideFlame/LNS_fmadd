add: PWL.c 
	clang++ -g PWL.c
	./a.out > output.txt

sub: PWL_sub.c 
	clang++ -g PWL_sub.c
	./a.out > output.txt

simulate: S_B.sv S_B_tb.sv
	iverilog -g2012 S_B.sv S_B_tb.sv 
	./a.out
