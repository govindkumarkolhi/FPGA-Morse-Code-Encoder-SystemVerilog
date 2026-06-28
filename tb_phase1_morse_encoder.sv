

//testbench

`timescale 1ns/1ps

module tb_phase1;

    logic [3:0] number;
    logic clk;
    logic btn1;
    logic rst;
    logic led;

    // DUT
    single_bit_morse_encoder dut (
        .number(number),
        .clk(clk),
        .btn1(btn1),
        .rst(rst),
        .led(led)
    );

    // Clock generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        // Initialize
        rst    = 1;
        btn1   = 0;
        number = 0;

        #150;
        rst = 0;

        //---------------------------------
        // Test Digit 7 = .....
        //---------------------------------
        $display("Testing digit 7");

        number = 4'd7;

        #150;
        btn1 = 1;

        #10;
        btn1 = 0;

        #1500;

        //---------------------------------
        // Test Digit 1 = .----
        //---------------------------------
        $display("Testing digit 1");

        number = 4'd1;

        #150;
        btn1 = 1;

        #10;
        btn1 = 0;

        #2200;

        //---------------------------------
        // Test Digit 0 = -----
        //---------------------------------
        $display("Testing digit 0");

        number = 4'd0;

        #150;
        btn1 = 1;

        #10;
        btn1 = 0;

        #2200;

        $stop;
    end

endmodule