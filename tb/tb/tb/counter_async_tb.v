module counter_async_tb;

reg clk;
reg reset;
wire [3:0] count;

// DUT Instance
counter_async DUT (
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
    
    // Apply asynchronous reset
    reset = 1;
    #15;
    
    reset = 0;   // Release reset, counter starts
    #60;

    reset = 1;   // Reset mid-clock (async behavior)
    #10;

    reset = 0;
    #40;

    $finish;
end

endmodule
