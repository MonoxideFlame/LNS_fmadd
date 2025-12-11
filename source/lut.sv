module F_3 (input [4:0] z, output reg signed [10:0] out);
    always_comb begin
        case(z)
            5'd0: out = -11'sd1024;
            5'd1: out = -11'sd964;
            5'd2: out = -11'sd837;
            5'd3: out = -11'sd762;
            5'd4: out = -11'sd710;
            5'd5: out = -11'sd669;
            5'd6: out = -11'sd636;
            5'd7: out = -11'sd608;
            5'd8: out = -11'sd584;
            5'd9: out = -11'sd562;
            5'd10: out = -11'sd543;
            5'd11: out = -11'sd526;
            5'd12: out = -11'sd511;
            5'd13: out = -11'sd496;
            5'd14: out = -11'sd483;
            5'd15: out = -11'sd471;
            5'd16: out = -11'sd460;
            5'd17: out = -11'sd449;
            5'd18: out = -11'sd439;
            5'd19: out = -11'sd429;
            5'd20: out = -11'sd420;
            5'd21: out = -11'sd412;
            5'd22: out = -11'sd404;
            5'd23: out = -11'sd396;
            5'd24: out = -11'sd389;
            5'd25: out = -11'sd382;
            5'd26: out = -11'sd375;
            5'd27: out = -11'sd368;
            5'd28: out = -11'sd362;
            5'd29: out = -11'sd356;
            5'd30: out = -11'sd350;
            5'd31: out = -11'sd345;
        endcase
    end
endmodule


module F_4(input [5:0] z, output reg signed [10:0] out);
    always_comb begin
        case(z)
            6'sd1: out = -11'sd339;
            6'sd2: out = -11'sd227;
            6'sd3: out = -11'sd167;
            6'sd4: out = -11'sd128;
            6'sd5: out = -11'sd101;
            6'sd6: out = -11'sd81;
            6'sd7: out = -11'sd65;
            6'sd8: out = -11'sd53;
            6'sd9: out = -11'sd44;
            6'sd10: out = -11'sd36;
            6'sd11: out = -11'sd30;
            6'sd12: out = -11'sd25;
            6'sd13: out = -11'sd21;
            6'sd14: out = -11'sd17;
            6'sd15: out = -11'sd14;
            6'sd16: out = -11'sd12;
            6'sd17: out = -11'sd10;
            6'sd18: out = -11'sd8;
            6'sd19: out = -11'sd7;
            6'sd20: out = -11'sd6;
            6'sd21: out = -11'sd5;
            6'sd22: out = -11'sd4;
            6'sd23: out = -11'sd3;
            6'sd24: out = -11'sd3;
            6'sd25: out = -11'sd2;
            6'sd26: out = -11'sd2;
            6'sd27: out = -11'sd2;
            6'sd28: out = -11'sd1;
            6'sd29: out = -11'sd1;
            6'sd30: out = -11'sd1;
            6'sd31: out = -11'sd1;
            default: out = 11'sd0;
        endcase 
    end
endmodule
