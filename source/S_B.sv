module S_B (
    input signed [10:0] z,
    output reg signed [10:0] s_b
);

    reg [3:0] weight1;
    reg [3:0] weight2;
    reg signed [10:0] abcissa;

/*

    long long input_long <= input;
    static int weights[] <= {
       0, 5, 20, 40, 64, 96, 128 
    };
    static int flat_abcissae[] <= {
        0, 948, 664, 515, 419, 328, 256, 
    };
    static int interval[] <= {-964,-534,-357,-248,-137,-49,0};

    return ((input_long + flat_abcissae[j])*weights[j] >> 8);

*/
    always @ (z) begin 
        if(z > -47) begin 
            weight1 <= 12;
            weight2 <= 1;
            abcissa <= 257;
        end else if(z > -142) begin 
            weight1 <= 2;
            weight2 <= 3;
            abcissa <= 330;

        end else if(z > -264) begin 
            weight1 <= 12;
            weight2 <= 2;
            abcissa <= 421;

        end else if(z > -367) begin 
            weight1 <= 3;
            weight2 <= 5;
            abcissa <= 519;

        end else if(z > -537) begin 
            weight1 <= 4;
            weight2 <= 6;
            abcissa <= 664;
            $display("<537");

        end else if(z > -960) begin 
            weight1 <= 6;
            weight2 <= 8;
            abcissa <= 1000;

        end else begin
            weight1 <= 12;
            weight2 <= 12;
            abcissa <= 1024;
        end
    end

    always @ (weight1 or weight2 or abcissa or z) begin
        s_b <= ((z+abcissa) >>> weight1) + ((z+abcissa) >>> weight2);
    end  

endmodule
