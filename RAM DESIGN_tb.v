`timescale 1ns/1ps

module tb_synchronous_ram;

    reg clk;
    reg we;
    reg [3:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    // Instantiate RAM
    synchronous_ram uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        $display("Time\tWE\tAddr\tDin\tDout");

        clk = 0;
        we  = 0;
        addr = 0;
        din = 0;

        // WRITE OPERATIONS
        #10 we = 1; addr = 4'd0; din = 8'd11;
        #10 we = 1; addr = 4'd1; din = 8'd22;
        #10 we = 1; addr = 4'd2; din = 8'd33;

        // READ OPERATIONS
        #10 we = 0; addr = 4'd0;
        #10 we = 0; addr = 4'd1;
        #10 we = 0; addr = 4'd2;

        #10 $finish;
    end

    // Monitor values
    initial begin
        $monitor("%0t\t%b\t%d\t%d\t%d", $time, we, addr, din, dout);
    end

endmodule
