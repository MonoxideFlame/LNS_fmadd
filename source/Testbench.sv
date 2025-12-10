module tb;

reg signed [10:0] x;
reg signed [10:0] y;
wire signed [10:0] out;
wire out_sign;
reg x_sign;
reg y_sign;

real epsilon = 0.0078125;
Adder  dut(.x({x_sign, x}), .y({y_sign, y}), .out({out_sign, out}));

real pct_err;
real max_error = 0.0;
initial begin 
    /*
    x_sign = 0;
    y_sign = 0; 

    for(x = -16; x < 16; x++) begin
        for(y = -16; y < 16; y++) begin
            #10;
            pct_err = 100 * $abs(($pow(2.0, out*epsilon) / ($pow(2.0, x*epsilon) + $pow(2.0, y*epsilon))) - 1.0 );
            if(pct_err > max_error) begin
                max_error = pct_err;
            end
            $display("x = %f, y = %f, out = %f,  err = %f pct", 
                $pow(-1.0, x_sign) * $pow(2.0, x * epsilon), 
                $pow(-1.0, y_sign) * $pow(2.0, y * epsilon),
                $pow(-1.0, out_sign) * $pow(2.0, out * epsilon), 
                pct_err
            );
        end
    end
*/
    x_sign = 1;
    y_sign = 0; 

    for(x = -256; x < 256; x++) begin
        for(y = -16; y < 16; y++) begin
            #10;
            pct_err = 100 * $abs(($pow(2.0, out*epsilon) / ($pow(2.0, x*epsilon) + $pow(2.0, y*epsilon))) - 1.0 );
            if(pct_err > max_error) begin
                max_error = pct_err;
            end
            $display("x = %f, y = %f, out = %f,  err = %f pct", 
                $pow(2.0, x * epsilon), 
                $pow(2.0, y * epsilon),
                $pow(2.0, out * epsilon), 
                pct_err
            );
        end
    end

    x_sign = 0;
    y_sign = 1; 

    for(x = -256; x < 256; x++) begin
        for(y = -16; y < 16; y++) begin
            #10;
            pct_err = 100 * $abs(($pow(2.0, out*epsilon) / ($pow(2.0, x*epsilon) + $pow(2.0, y*epsilon))) - 1.0 );
            if(pct_err > max_error) begin
                max_error = pct_err;
            end
            $display("x = %f, y = %f, out = %f,  err = %f pct", 
                $pow(2.0, x * epsilon), 
                $pow(2.0, y * epsilon),
                $pow(2.0, out * epsilon), 
                pct_err
            );
        end
    end
/*
    x_sign = 1;
    y_sign = 1; 

    for(x = -16; x < 16; x++) begin
        for(y = -16; y < 16; y++) begin
            #10;
            pct_err = 100 * $abs(($pow(2.0, out*epsilon) / ($pow(2.0, x*epsilon) + $pow(2.0, y*epsilon))) - 1.0 );
            if(pct_err > max_error) begin
                max_error = pct_err;
            end
            $display("x = %f, y = %f, out = %f,  err = %f pct", 
                $pow(2.0, x * epsilon), 
                $pow(2.0, y * epsilon),
                $pow(2.0, out * epsilon), 
                pct_err
            );
        end
    end
    $display("max_err %f", max_error);
    */
end










endmodule
