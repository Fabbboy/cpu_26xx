module cpu_2601 (
    input  logic clk,
    input  logic rst,
    output logic alive
);

    always_ff @(posedge clk) begin
        if (rst)
            alive <= 1'b0;
        else
            alive <= ~alive;
    end

endmodule
