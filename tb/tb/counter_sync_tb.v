module counter_sync_tb;

reg clk;
reg reset;
wire [3:0] count;

// DUT Instance
counter_sync DUT (
    .clk(clk),
    .reset(reset),
    .count(count)
);

// Generate clock
always #5 clk = ~clk;

initial begin
    $display("Time | Reset | Count");
    $monitor("%4t |   %b   |  %b", $time, reset, count);

    clk = 0;
    reset = 1;   // Apply reset
    #10;
    
    reset = 0;   // Release reset, counter starts
    #100;

    reset = 1;   // Reset again
    #10;
    
    reset = 0;
    #50;

    $finish;
end

endmodule
