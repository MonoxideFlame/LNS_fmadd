module tb;

reg signed [10:0] z;
wire [10:0] s_b;

S_B  dut (
    .z(z),
    .s_b(s_b)
);

initial begin 
    z = '0;

    for(z = 0; z > -1024; z = z - 1)begin
        #10;
        $display("%d, %d", z, s_b);
    end



end










endmodule
