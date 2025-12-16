module F_3 (input [4:0] z, output reg signed [10:0] out);
    always @ (*) begin
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


module F_4(input [6:0] z, output reg signed [10:0] out);
    always @ (*) begin
        case(z)
            7'sd1: out = -11'sd339;
            7'sd2: out = -11'sd227;
            7'sd3: out = -11'sd167;
            7'sd4: out = -11'sd128;
            7'sd5: out = -11'sd101;
            7'sd6: out = -11'sd81;
            7'sd7: out = -11'sd65;
            7'sd8: out = -11'sd53;
            7'sd9: out = -11'sd44;
            7'sd10: out = -11'sd36;
            7'sd11: out = -11'sd30;
            7'sd12: out = -11'sd25;
            7'sd13: out = -11'sd21;
            7'sd14: out = -11'sd17;
            7'sd15: out = -11'sd14;
            7'sd16: out = -11'sd12;
            7'sd17: out = -11'sd10;
            7'sd18: out = -11'sd8;
            7'sd19: out = -11'sd7;
            7'sd20: out = -11'sd6;
            7'sd21: out = -11'sd5;
            7'sd22: out = -11'sd4;
            7'sd23: out = -11'sd3;
            7'sd24: out = -11'sd3;
            7'sd25: out = -11'sd2;
            7'sd26: out = -11'sd2;
            7'sd27: out = -11'sd2;
            7'sd28: out = -11'sd1;
            7'sd29: out = -11'sd1;
            7'sd30: out = -11'sd1;
            7'sd31: out = -11'sd1;
            default: out = 11'sd0;
        endcase 
    end
endmodule
