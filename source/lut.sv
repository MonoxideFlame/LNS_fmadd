module F_3 (input [4:0] z, output reg signed [10:0] out);
    always_comb begin
        case(z)
            5'd0: out = -11'sd1024;
            5'd1: out = -11'sd963;
            5'd2: out = -11'sd836;
            5'd3: out = -11'sd761;
            5'd4: out = -11'sd709;
            5'd5: out = -11'sd668;
            5'd6: out = -11'sd635;
            5'd7: out = -11'sd607;
            5'd8: out = -11'sd583;
            5'd9: out = -11'sd561;
            5'd10: out = -11'sd542;
            5'd11: out = -11'sd525;
            5'd12: out = -11'sd510;
            5'd13: out = -11'sd495;
            5'd14: out = -11'sd482;
            5'd15: out = -11'sd470;
            5'd16: out = -11'sd459;
            5'd17: out = -11'sd448;
            5'd18: out = -11'sd438;
            5'd19: out = -11'sd429;
            5'd20: out = -11'sd419;
            5'd21: out = -11'sd411;
            5'd22: out = -11'sd403;
            5'd23: out = -11'sd395;
            5'd24: out = -11'sd388;
            5'd25: out = -11'sd381;
            5'd26: out = -11'sd374;
            5'd27: out = -11'sd368;
            5'd28: out = -11'sd361;
            5'd29: out = -11'sd355;
            5'd30: out = -11'sd349;
            5'd31: out = -11'sd344;
        endcase
    end
endmodule


module F_4(input [5:0] z, output reg signed [10:0] out);
    always_comb begin
        case(z)
            0: out = -11'sd1024;
            1: out = -11'sd338;
            2: out = -11'sd226;
            3: out = -11'sd166;
            4: out = -11'sd127;
            5: out = -11'sd100;
            6: out = -11'sd80;
            7: out = -11'sd65;
            8: out = -11'sd52;
            9: out = -11'sd43;
            10: out = -11'sd35;
            11: out = -11'sd29;
            12: out = -11'sd24;
            13: out = -11'sd20;
            14: out = -11'sd16;
            15: out = -11'sd13;
            16: out = -11'sd11;
            17: out = -11'sd9;
            18: out = -11'sd7;
            19: out = -11'sd6;
            20: out = -11'sd5;
            21: out = -11'sd4;
            22: out = -11'sd3;
            23: out = -11'sd2;
            24: out = -11'sd2;
            25: out = -11'sd1;
            26: out = -11'sd1;
            27: out = -11'sd1;
            default: out = 0;
        endcase 
    end
endmodule
