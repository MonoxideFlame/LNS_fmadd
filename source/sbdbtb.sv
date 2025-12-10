module sbdbtb;

wire signed [10:0] out;
reg signed [10:0] x;
reg signed [10:0] y;

SBDB sbdb(.x(x), .y(y), .z_s(1), .out(out));

initial begin
    

    for(x = -16; x < 16; x++) begin
        for(y = -16; y < 16; y++) begin 
            #10;
            $display("x: %d, y: %d, out: %d,", x, y, out);
        end
    end

end



endmodule
