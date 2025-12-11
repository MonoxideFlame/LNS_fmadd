module tb;


reg signed [10:0] x_abs;
reg signed [10:0] y_abs;
reg signed [10:0] out_abs;
reg signed [10:0] max_abs;
reg x_sign;
reg y_sign;
reg out_sign;

wire signed [10:0] db;


//not synthesized: 
real epsilon = 0.0078125;
real exact;
real error;
real x_val;
real y_val;
real out_val;
//



Adder dut(.x({x_sign, x_abs}), .y({y_sign, y_abs}), .out({out_sign, out_abs}));
//Preprocessor dut(.y({y_sign, y_abs}), .x({x_sign, x_abs}), .z_s(z_s), .z(abs_diff), .max_xy(max_abs), .result_sign(out_sign));

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
            error = (out_val/exact - 1.0) * 100.0;
            #10;
            $display("x = %f (%d), y = %f (%d), out = %f (%d), exact = %f, pct err: %f %%", x_val, x_abs, y_val, y_abs, out_val, out_abs, exact, error);
 //           $display("(%d, %d) max_xy = (%d), sign = %d, z_s = %d, ", x_abs, y_abs, max_abs, out_sign, z_s);
        end
    end

end










endmodule
