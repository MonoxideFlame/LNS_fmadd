`include "lut.sv"
`include "preprocessor.sv"
`include "S_B.sv"



module Add_sub(input signed [10:0] x, input signed [10:0] y, input z_s, output reg [10:0] t);

    reg signed [10:0] z;
    reg signed [10:0] w;
    wire signed [10:0] ql;
    wire signed [10:0] qh;
    reg signed [10:0] zhat;
    reg signed [10:0] what;
    wire signed [10:0] s_b_out;

    Preprocessor preprocessor(.x(x), .y(y), .z_s(z_s), .z(z), .w(w));
    F_3 f_3(.z(z[5:0]), .out(ql));
    F_4 f_4(.z(z[10:6]), .out(qh));
    S_B add_lookup(.z(zhat), .s_b(s_b_out));

    always_comb begin
        if(z_s) begin
            zhat = (ql - qh);
            what = w + z[5:0] + qh;
        end else begin
            zhat = z;
            what = w;
        end
    end

    always_comb begin
        t = s_b_out + what;
    end

endmodule


module Adder (input signed [11:0] x, input signed [11:0] y, output reg signed [11:0] out);

    wire signed [10:0] t;
    reg signed [10:0] x_nosign;
    reg signed [10:0] y_nosign;
    reg signed z_s;
    reg x_big; //1 if x is larger than y

    Add_sub add_sub(.x(x_nosign), .y(y_nosign), .z_s(z_s), .t(t));


    always_comb begin
        x_nosign = x[10:0];
        y_nosign = y[10:0];
        z_s = x[11] ^ y[11];
    end

    always_comb begin
        if(x > y) begin
            x_big = 1'b1;
        end else begin 
            x_big = 1'b0;
        end
    end


    always_comb begin
        if(z_s) begin
            if(x_big) begin
                out = {x[11], t};
            end else begin
                out = {y[11], t};
            end
        end else begin
            out = {x[11], t};
        end
    end

endmodule
