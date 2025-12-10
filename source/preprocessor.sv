module Preprocessor(input signed [10:0] x, input signed [10:0] y, input z_s, output reg signed [10:0] w, output reg signed [10:0] z);


    always_comb begin
        if(z_s) begin
            z = ((x-y) ^ ((x-y) >>> 12)) - ((x - y) >>> 12);//abs of twos complement
            if(x > y) begin
                w = y;
            end else begin
                w = x;
            end
        end else begin
            z = ((x-y) >>> 12) - ((x-y) ^ ((x-y) >>> 12));//-abs of twos complement
            if(x > y) begin
                w = x;
            end else begin
                w = y;
            end
        end
    end
endmodule
