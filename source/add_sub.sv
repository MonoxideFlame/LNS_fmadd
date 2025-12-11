module Preprocessor(input [11:0] x, input [11:0] y, output reg z_s, output reg [10:0] z, output reg signed [10:0] max_xy, output reg result_sign);
    
    always_comb begin
            if({~x[10], x[9:0]} > {~y[10], y[9:0]}) begin
                max_xy = x[10:0];
                z = y[10:0] - x[10:0];
                result_sign = x[11];
            end else begin
                max_xy = y[10:0];
                z = x[10:0] - y[10:0];
                result_sign = y[11];
            end
            z_s = x[11] ^ y[11];
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

    Preprocessor pprop(.x(x), .y(y), .z(abs_diff), .max_xy(max_xy), .result_sign(out_sign), .z_s(z_s));
    SBDB sbdb(.z(abs_diff), .z_s(z_s), .out(t));


    always_comb begin
        if(x_nosign == y_nosign) begin
            if(z_s) begin
                out = {1'b0, 11'b10000000000};
            end else begin
                out = {x[11], x[10:0] + 11'd128};
            end
        end else begin
            out = {out_sign, t + max_xy};
        end
    end

endmodule
