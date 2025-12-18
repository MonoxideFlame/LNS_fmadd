module lut_tb;

    reg [7:0] i;

    wire signed [10:0] lut_out;

    F_4 lut_dut(.z(i[6:0]), .out(lut_out));

    initial begin
        for(i = 0; i < 128; i++) begin
            #10;
            $display("%d", lut_out);
        end

    end 


endmodule
