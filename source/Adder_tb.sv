module Adder_tb;


reg signed [10:0] x_abs;
reg signed [10:0] y_abs;
reg signed [10:0] out_abs;
reg signed [10:0] max_abs;
reg x_sign;
reg y_sign;
reg out_sign;


Adder dut(.x({x_sign, x_abs}), .y({y_sign, y_abs}), .out({out_sign, out_abs}));

//not synthesized: 
real epsilon = 0.0078125;
real exact;
real error;
real x_val;
real y_val;
real out_val;
//


initial begin 
    x_sign = 0;
    y_sign = 1;

    for(x_abs = -16; x_abs < 16; x_abs++) begin
        for(y_abs = -16; y_abs < 16; y_abs++) begin
            #10;

            x_val = (1.0 - 2.0 * x_sign) * $pow(2.0, x_abs * epsilon);
            y_val = (1.0 - 2.0 * y_sign) * $pow(2.0, y_abs * epsilon);
            out_val = (1.0 - 2.0 * out_sign) * $pow(2.0, out_abs * epsilon);
            exact = x_val + y_val;

//            $display("x = %d, y = %d, out = %d", x_abs, y_abs, out_abs);
            $display("x = %f, y = %f, out = %f, exact = %f, err = %f", x_val , y_val, out_val, exact, 100 * (out_val/exact) - 100.0);
        end
    end



end
endmodule
