#include <stdlib.h>
#include <math.h>
#include <stdio.h>

int fxp_log_sub(int input){
    if(input <= 0){
        double in_as_float = input/128.0;//converting our 7 fraction bits.
        double out_as_float = log2(1 - exp2(in_as_float)); 
        return ((int) ((out_as_float)*128.0 - 0.5));
    } else {
        double in_as_float = input/128.0;//converting our 7 fraction bits.
        double out_as_float = log2(1 - exp2(-in_as_float)) + in_as_float; 
        return ((int) ((out_as_float)*128.0 - 0.5));
    }
}

int fxp_log_add(int input){
    if(input <= 0){
        double in_as_float = input/128.0;//converting our 7 fraction bits.
        double out_as_float = log2(1 + exp2(in_as_float)); 
        return ((int) ((out_as_float)*128.0 + 0.5));
    } else {
        double in_as_float = input/128.0;//converting our 7 fraction bits.
        double out_as_float = log2(1 + exp2(-in_as_float)) + in_as_float; 
        return ((int) ((out_as_float)*128.0 + 0.5));
    }
}

int main(void) {
    for(int i = 0; i < 32; i+=1){
        printf("%d: out = %d;\n", i, fxp_log_sub(-i));
    }
    for(int i = 0; i < 1024; i+=32){
        printf("6'sd%d: out = %d;\n", i/32, fxp_log_sub(-i));
    }

    return 0;
}


