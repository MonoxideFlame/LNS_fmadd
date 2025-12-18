module sbdbtb;

wire signed [10:0] out;
reg signed [11:0] z;
reg signed [31:0] i;
real exact;
real epsilon = 1.0/128.0;

reg z_s;

S_B sbdut(.z(z), .s_b(out));

initial begin
    z_s = 0;

    for(i = 0; i < 1023; i++) begin
        #10;
        z = -(i[11:0]);
        #10;
        exact = 128 * $ln(1 - $pow(2.0, -z*epsilon))/$ln(2);
        $display("z: %d, out: %d, exact: %f, error %d", z, out, exact, out - int'(exact));
    end

end



endmodule
