`include "lut.sv"
`include "S_B.sv"


module Preprocessor(input signed [10:0] x, input signed [10:0] y, input z_s, output reg signed [10:0] z, output reg signed [10:0] max_xy);

    always_comb begin
            if(x > y) begin
                max_xy = y;
            end else begin
                max_xy = x;
            end
    end

    always_comb begin
        if(z_s) begin
            z = ((x-y) ^ ((x-y) >>> 12)) - ((x - y) >>> 12);//abs of twos complement
        end
    end
endmodule

module SBDB(input [10:0] z, input z_s, output reg signed [10:0] out);
    
    reg signed [10:0] zhat;
    wire signed [10:0] ql;
    wire signed [10:0] qh;
    wire signed [10:0] s_b_out;

    F_3 f_3(.z(z[4:0]), .out(ql));
    F_4 f_4(.z(z[10:5]), .out(qh));
    S_B add_lookup(.z(zhat), .s_b(s_b_out));

    always_comb begin
        if(z_s) begin
            zhat = ql - qh + z[4:0];
        end else begin
            zhat = -z;
        end
    end

    always_comb begin
        if(z_s) begin
            if(z[4:0] == 5'd0) begin
                out = qh;
            end else if(z[10:5] == 5'd0) begin
                out = ql;
            end else begin
                out = qh + s_b_out - z[4:0];
            end
        end else begin
            out = s_b_out;
        end
    end


endmodule


module Adder (input signed [11:0] x, input signed [11:0] y, output reg signed [11:0] out);

    wire signed [10:0] t;
    wire signed [10:0] abs_diff;
    wire signed [10:0] max_xy;

    wire signed [10:0] x_nosign;
    assign x_nosign = x[10:0];

    wire signed [10:0] y_nosign;
    assign y_nosign = y[10:0];

    wire signed z_s;
    assign z_s = x[11] ^ y[11];

    Preprocessor pprop(.x(x_nosign), .y(y_nosign), .z(abs_diff), .max_xy(max_xy));
    SBDB sbdb(.z(abs_diff), .z_s(z_s), .out(t));


    always_comb begin
        if(x_nosign == y_nosign) begin
            if(z_s) begin
                out = {1'b0, 11'b10000000000};
            end else begin
                out = {x[11], x_nosign + 11'd128};
            end
        end else if(x_nosign > y_nosign) begin
            out = {x[11], t + x_nosign};
        end else begin
            out = {y[11], t + y_nosign};
        end
    end

endmodule
