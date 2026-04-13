module synchronous_ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    input clk,
    input we,
    input [ADDR_WIDTH-1:0] addr,
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout
);

    // Memory array (16 locations for ADDR_WIDTH = 4)
    reg [DATA_WIDTH-1:0] memory [0:(1<<ADDR_WIDTH)-1];

    always @(posedge clk) begin
        if (we)
            memory[addr] <= din;   // Write
        dout <= memory[addr];      // Read
    end

endmodule
