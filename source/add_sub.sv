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
    
    reg signed [10:0] abs_diff;
    reg signed [10:0] max_xy;
    reg signed z_s;
    reg signed out_sign;
    reg signed [11:0] large_result_abs;

    SBDB sbdb(.z(abs_diff), .z_s(z_s), .out(t));

    always_comb begin
        z_s = x[11] ^ y[11];
        if({~x[10], x[9:0]} > {~y[10], y[9:0]}) begin
            abs_diff = x[10:0] - y[10:0];
            max_xy = x;
            out_sign = x[11];
        end else begin
            abs_diff = y[10:0] - x[10:0];
            max_xy = y;
            out_sign = y[11];
        end
    end


    always_comb begin
        if(x[10:0] == y[10:0]) begin
            if(z_s) begin
                out = {1'b0, 11'b10000000000};
            end else begin
                out = {x[11], x[10:0] + 11'd128};
            end
        end else begin
            large_result_abs = {t[10], t} + {max_xy[10], max_xy};
            if(large_result_abs > 12'sd1023) begin
                out = {out_sign, 11'sd1023};
            end else if (large_result_abs < -12'sd1024) begin
                out = {out_sign, -11'sd1024};
            end else begin
                out = {out_sign, large_result_abs[10:0]};
            end
        end
    end

endmodule
