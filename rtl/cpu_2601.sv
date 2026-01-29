module cpu_2601 (
    input  logic clk,
    input  logic rst
);

    logic [31:0] tick;

    always_ff @(posedge clk) begin
        if (rst) begin
            tick <= 32'd0;
        end else begin
            tick <= tick + 32'd1;
        end
    end

endmodule
