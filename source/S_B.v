module S_B (
    input [10:0] z,
    output reg [10:0] s_b
);

    reg [3:0] weight1;
    reg [3:0] weight2;
    reg [10:0] abcissa;

/*

    long long input_long = input;
    static int weights[] = {
       0, 5, 20, 40, 64, 96, 128 
    };
    static int flat_abcissae[] = {
        0, 948, 664, 515, 419, 328, 256, 
    };
    static int interval[] = {-964,-534,-357,-248,-137,-49,0};

    return ((input_long + flat_abcissae[j])*weights[j] >> 8);

*/
    always @ (z) begin 
        if(z > -49) begin 
            weight1 = 12;
            weight2 = 1;
            abcissa = 256;
        end else if(z > -137) begin 
            weight1 = 2;
            weight2 = 3;
            abcissa = 328;

        end else if(z > -248) begin 
            weight1 = 12;
            weight2 = 2;
            abcissa = 419;

        end else if(z > -357) begin 
            weight1 = 3;
            weight2 = 5;
            abcissa = 515;

        end else if(z > -534) begin 
            weight1 = 4;
            weight2 = 6;
            abcissa = 664;

        end else if(z > -964) begin 
            weight1 = 6;
            weight2 = 8;
            abcissa = 948;

        end else begin
            weight1 = 12;
            weight2 = 12;
            abcissa = 0;
        end
    end

    always @ (weight1 or weight2 or abcissa) begin
        s_b = (z >> weight1) + (z >> weight2) + abcissa;
    end  

endmodule
