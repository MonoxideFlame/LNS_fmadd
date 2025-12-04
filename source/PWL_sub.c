
#include <stdio.h>

#include <stdlib.h>
#include <math.h>



//Numerical Format:
//
//s_iiii_fffffff
//where X = s * 2^I * 2^(F/128)
//
//representing zero with the most negative (IF)
//
//
//
//









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

int fxp_log_add(int input){
    double in_as_float = input/128.0;//converting our 7 fraction bits.
    double out_as_float = log2(1 + exp2(in_as_float)); 
    return ((int) ((out_as_float)*128.0));
}

int pwl_sum(int input){
    long long input_long = input;
    static int weights[] = {
       0, 5, 20, 40, 64, 96, 128 
    };
    static int flat_abcissae[] = {
        0, 948, 664, 515, 419, 328, 256, 
    };
    /*
    static int abcissas[] = {
       0,534,357,247,131,64,0
    };
    static int biases[] = {
       0,9,24,42,72,99,128
    };
    */
    static int interval[] = {-964,-534,-357,-248,-137,-49,0};

//basic linear search. will become Binary search when Hardware:

    int j = 0;
    for(int i = 0 ; i < 7; i++){
        if(input_long > interval[i]){
            j++;
        }
    }

    //return ((input_long + abcissas[j])*weights[j] >> 8) + biases[j];
    return ((input_long + flat_abcissae[j])*weights[j] >> 8);
}


int pwl_diff(int z){//takes a positive input, and uses the min instead of the max. 
    static int F_3[64] = { -21474, -964, -836, -762, -709, -668, -635, -607, -583, -562, -543,  -526,  -510,  -496,  -483,  -471,  -459,  -448,  -438,  -429,  -420,  -411,  -403,  -396,  -388,  -381,  -374,  -368,  -362,  -356,  -350,  -344,  -339,  -334,  -329,  -324,  -319,  -315,  -310,  -306,  -302,  -298,  -294,  -290,  -286,  -282,  -279,  -275,  -272,  -268,  -265,  -262,  -259,  -256,  -253,  -250,  -247,  -244,  -242,  -239,  -236,  -234,  -231,  -229 };//
    static int F_4[17] = {-1024,-162, 0, 111, 202, 284, 359, 430, 500, 567, 634, 699, 765, 829, 894, 958, 1023 };
    
    int zl = z & 63;
    int zh = (z >> 6) & 63;

    int z_hat;
    int w_hat;
    if(zh != 0){
        if(zh > 16) {
            z_hat = F_3[zl] - 64*zh;
            w_hat = 64*zh + zl - 1;
        } else {
            z_hat = F_3[zl] - F_4[zh] - 1;
            w_hat = F_4[zh] + zl + 1;
        }
    } else {
        return F_3[zl] + zl;
    }

    return pwl_sum(z_hat) + w_hat;
}




int main(int argc, char** argv){
    long long sum = 0;
    /*
    for(int i = 0; i < 64; i++){
     //   int weight; int abcissa; int bias;
        printf("z_l: %d,  F_3: %d, z_h: %d, F_4: %d\n", i, fxp_log_sub(-i), 64*i, fxp_log_sub(64*i));
        //sum += (out) * (fxp_log_add(-i) - out);
    }
*/


    for(int i = 0; i < 4096; i++){
     //   int weight; int abcissa; int bias;
        printf("%d:%d:%d:%d\n", i, fxp_log_sub(i), pwl_diff(i), pwl_diff(i) - fxp_log_sub(i));
        //sum += (out) * (fxp_log_add(-i) - out);
    }
    return 0;
}

