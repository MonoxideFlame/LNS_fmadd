module F_3 (input signed [5:0] z, output reg signed [10:0] out);
    always_comb begin
        case(z)
            0: out = -11'sd1024;
            1: out = -11'sd963;
            2: out = -11'sd834;
            3: out = -11'sd759;
            4: out = -11'sd705;
            5: out = -11'sd663;
            6: out = -11'sd629;
            7: out = -11'sd600;
            8: out = -11'sd575;
            9: out = -11'sd553;
            10: out = -11'sd533;
            11: out = -11'sd515;
            12: out = -11'sd498;
            13: out = -11'sd483;
            14: out = -11'sd469;
            15: out = -11'sd456;
            16: out = -11'sd443;
            17: out = -11'sd431;
            18: out = -11'sd420;
            19: out = -11'sd410;
            20: out = -11'sd400;
            21: out = -11'sd390;
            22: out = -11'sd381;
            23: out = -11'sd373;
            24: out = -11'sd364;
            25: out = -11'sd356;
            26: out = -11'sd348;
            27: out = -11'sd341;
            28: out = -11'sd334;
            29: out = -11'sd327;
            30: out = -11'sd320;
            31: out = -11'sd313;
            32: out = -11'sd307;
            33: out = -11'sd301;
            34: out = -11'sd295;
            35: out = -11'sd289;
            36: out = -11'sd283;
            37: out = -11'sd278;
            38: out = -11'sd272;
            39: out = -11'sd267;
            40: out = -11'sd262;
            41: out = -11'sd257;
            42: out = -11'sd252;
            43: out = -11'sd247;
            44: out = -11'sd242;
            45: out = -11'sd237;
            46: out = -11'sd233;
            47: out = -11'sd228;
            48: out = -11'sd224;
            49: out = -11'sd219;
            50: out = -11'sd215;
            51: out = -11'sd211;
            52: out = -11'sd207;
            53: out = -11'sd203;
            54: out = -11'sd199;
            55: out = -11'sd195;
            56: out = -11'sd191;
            57: out = -11'sd187;
            58: out = -11'sd184;
            59: out = -11'sd180;
            60: out = -11'sd176;
            61: out = -11'sd173;
            62: out = -11'sd169;
            63: out = -11'sd166;
        endcase
    end
endmodule


module F_4(input signed [4:0] z, output reg signed [10:0] out);
    always_comb begin
        case(z)
            0:out = -11'sd1024;
            1:out = -11'sd162;
            2:out = 11'sd0;
            3:out = 11'sd111;
            4:out = 11'sd202;
            5:out = 11'sd284;
            6:out = 11'sd359;
            7:out = 11'sd430;
            8:out = 11'sd500;
            9:out = 11'sd567;
            10:out = 11'sd634;
            11:out = 11'sd699;
            12:out = 11'sd765;
            13:out = 11'sd829;
            14:out = 11'sd894;
            15:out = 11'sd958;
            16:out = 11'sd1023;
            default: out = {z, 6'd0};
        endcase 
    end
endmodule
