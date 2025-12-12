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
real max_err;
real x_val;
real y_val;
real out_val;
//


initial begin 
    $display("Addition: ");
    $display("x, y, out, exact, pct err");
    x_sign = 0;
    y_sign = 0;
    max_err = 0;
    for(x_abs = -1024; x_abs < 1023; x_abs++) begin
        for(y_abs = -1024; y_abs < 1023; y_abs++) begin
            #10;

            x_val = (1.0 - 2.0 * x_sign) * $pow(2.0, x_abs * epsilon);
            y_val = (1.0 - 2.0 * y_sign) * $pow(2.0, y_abs * epsilon);
            out_val = (1.0 - 2.0 * out_sign) * $pow(2.0, out_abs * epsilon);
            exact = x_val + y_val;
            
            if(exact * exact < 0.003906 * 0.003906) begin
                if(exact < 0) begin
                    exact = -0.003906;
                end else begin
                    exact = 0.003906;
                end
            end


            error = 100.0 * (out_val/exact) - 100.0;
            if(error*error > max_err*max_err) begin
                max_err = error;
            end

//            $display("x = %d, y = %d, out = %d", x_abs, y_abs, out_abs);
            $display("%f, %f, %f, %f, %f", x_val , y_val, out_val, exact, 100 * (out_val/exact) - 100.0);
        end
    end
    
    x_sign = 1;
    y_sign = 1;
    max_err = 0;
    for(x_abs = -1024; x_abs < 1023; x_abs++) begin
        for(y_abs = -1024; y_abs < 1023; y_abs++) begin
            #10;

            x_val = (1.0 - 2.0 * x_sign) * $pow(2.0, x_abs * epsilon);
            y_val = (1.0 - 2.0 * y_sign) * $pow(2.0, y_abs * epsilon);
            out_val = (1.0 - 2.0 * out_sign) * $pow(2.0, out_abs * epsilon);
            exact = x_val + y_val;
            
            if(exact * exact < 0.003906 * 0.003906) begin
                if(exact < 0) begin
                    exact = -0.003906;
                end else begin
                    exact = 0.003906;
                end
            end

            if(exact * exact > 254.6174524 * 254.6174524) begin
                if(exact < 0) begin
                    exact = -254.6174524;
                end else begin
                    exact = 254.6174524;
                end
            end

            error = 100.0 * (out_val/exact) - 100.0;
            if(error*error > max_err*max_err) begin
                max_err = error;
            end

//            $display("x = %d, y = %d, out = %d", x_abs, y_abs, out_abs);
            $display("%f, %f, %f, %f, %f", x_val , y_val, out_val, exact, 100 * (out_val/exact) - 100.0);
        end
    end

    x_sign = 0;
    y_sign = 1;
    max_err = 0;
    for(x_abs = -1024; x_abs < 1023; x_abs++) begin
        for(y_abs = -1024; y_abs < 1023; y_abs++) begin
            #10;

            x_val = (1.0 - 2.0 * x_sign) * $pow(2.0, x_abs * epsilon);
            y_val = (1.0 - 2.0 * y_sign) * $pow(2.0, y_abs * epsilon);
            out_val = (1.0 - 2.0 * out_sign) * $pow(2.0, out_abs * epsilon);
            exact = x_val + y_val;
            
            if(exact * exact < 0.003906 * 0.003906) begin
                if(exact < 0) begin
                    exact = -0.003906;
                end else begin
                    exact = 0.003906;
                end
            end


            error = 100.0 * (out_val/exact) - 100.0;
            if(error*error > max_err*max_err) begin
                max_err = error;
            end

//            $display("x = %d, y = %d, out = %d", x_abs, y_abs, out_abs);
            $display("%f, %f, %f, %f, %f", x_val , y_val, out_val, exact, 100 * (out_val/exact) - 100.0);
        end
    end
    
    x_sign = 1;
    y_sign = 0;
    max_err = 0;
    for(x_abs = -1024; x_abs < 1023; x_abs++) begin
        for(y_abs = -1024; y_abs < 1023; y_abs++) begin
            #10;

            x_val = (1.0 - 2.0 * x_sign) * $pow(2.0, x_abs * epsilon);
            y_val = (1.0 - 2.0 * y_sign) * $pow(2.0, y_abs * epsilon);
            out_val = (1.0 - 2.0 * out_sign) * $pow(2.0, out_abs * epsilon);
            exact = x_val + y_val;
            
            if(exact * exact < 0.003906 * 0.003906) begin
                if(exact < 0) begin
                    exact = -0.003906;
                end else begin
                    exact = 0.003906;
                end
            end

            if(exact * exact > 254.6174524 * 254.6174524) begin
                if(exact < 0) begin
                    exact = -254.6174524;
                end else begin
                    exact = 254.6174524;
                end
            end

            error = 100.0 * (out_val/exact) - 100.0;
            if(error*error > max_err*max_err) begin
                max_err = error;
            end

//            $display("x = %d, y = %d, out = %d", x_abs, y_abs, out_abs);
            $display("%f, %f, %f, %f, %f", x_val , y_val, out_val, exact, 100 * (out_val/exact) - 100.0);
        end
    end
    $display("Max error: %f", max_err);
end
endmodule
