module sbdbtb;

wire signed [10:0] out;
reg signed [10:0] z;
real exact;
real epsilon = 1.0/128.0;

reg z_s;

SBDB sbdb(.z(z), .z_s(z_s), .out(out));

initial begin
    z_s = 1;

    for(z = 0; z < 1023; z++) begin
        #10;
        exact = 128 * $ln(1 - $pow(2.0, -z*epsilon))/$ln(2);
        $display("z: %d, out: %d, exact: %f, error %d", z, out, exact, out - int'(exact));
    end

    z_s = 0;

    for(z = 0; z < 1023; z++) begin
        #10;
        exact = 128 * $ln(1 + $pow(2.0, -z*epsilon))/$ln(2);
        $display("z: %d, out: %d, exact: %f, error %d", z, out, exact, out - int'(exact));
    end
end



endmodule
