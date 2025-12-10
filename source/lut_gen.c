#include <stdlib.h>
#include <math.h>
#include <stdio.h>

int fxp_log_sub(int input){
    if(input <= 0){
        double in_as_float = input/128.0;//converting our 7 fraction bits.
        double out_as_float = log2(1 - exp2(in_as_float)); 
        return ((int) ((out_as_float)*128.0));
    } else {
        double in_as_float = input/128.0;//converting our 7 fraction bits.
        double out_as_float = log2(1 - exp2(-in_as_float)) + in_as_float; 
        return ((int) ((out_as_float)*128.0));
    }
}


int main(void) {
    for(int i = 0; i < 32; i++){
        printf("%d: out = %d;\n", i, fxp_log_sub(-i));
    }

    return 0;
}


