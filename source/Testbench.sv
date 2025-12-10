module tb;


reg signed z_s;

reg signed [10:0] z;

wire signed [10:0] db;

real epsilon = 0.0078125;

SBDB sbdb(.z(z), .z_s(z_s), .out(db));

initial begin 
    
    z_s = 1;

    for(z = 0; z < 11'sd1023; z++) begin
        #100;
        $display("z = %d, db = %d, exact = %f", z, db, 128 * $ln(1 - $pow(2.0, -z*epsilon))/$ln(2) );
    end

end










endmodule
