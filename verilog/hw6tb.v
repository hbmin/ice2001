/*-------------------------------------------------------------------------
 *
 *  Copyright (c) 2022 by Hyoung Bok Min, All rights reserved.
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/#GPL>.
 *
 *
 *  File name  : hw6tb.v
 *  Written by : Min, Hyoung Bok, Professor
 *               School of Electrical Engineering
 *               Sungkyunkwan University
 *  Written on : Nov. 08, 2022
 *  version    : 1.0
 *  Design     : Testbench for circuit under test (e74FSM) in hw6.v
 *               e74FSM is a 3-bit Counter with 7-segment Driver.
 *
 *  Modification History:
 *      * v1.0: Nov. 08, 2022  by Hyoung Bok Min
 *        version 1.0 released.
 *
 -------------------------------------------------------------------------*/

`timescale 1ns/1ns

module hw6tb;

// Constants
parameter  CLOCK_PERIOD = 10;
localparam HALF_CLOCK_PERIOD = CLOCK_PERIOD/2;

// Wires connected to inputs and outputs of e74FSM
reg CLK, CE, RESET;
wire a, b, c, d, e, f, g;

// Return integer converted from 7-segments.
function [3:0] seg2integer (input a, b, c, d, e, f, g);
    reg [6:0] segs;
    reg [3:0] outval;
begin
    segs = {a, b, c, d, e, f, g};
    case (segs)
        7'b0000001 : outval = 0;
        7'b1001111 : outval = 1;
        7'b0010010 : outval = 2;
        7'b0000110 : outval = 3;
        7'b1001100 : outval = 4;
        7'b0100100 : outval = 5;
        7'b1100000 : outval = 6;
        7'b0001111 : outval = 7;
        7'b1111110 : outval = 10;   // invalid display indicator
        default : outval = 11;      // this is not possible
    endcase
    seg2integer = outval;
end
endfunction

// Instantiation of CUT (circuit under test)
e74FSM U1 (.RESET(RESET), .CLK(CLK), .CE(CE),
           .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));

// This is a clock generator of 100 MHz when CLOCK_PERIOD=10
always
begin : CLOCK_GENERATOR
     # HALF_CLOCK_PERIOD CLK = 1'b1;
     # HALF_CLOCK_PERIOD CLK = 1'b0;
end

// LED output from circuit and expected LED output value
parameter N = 20;    // number of test cases
reg [3:0] segout;    // integer LED output that corresponds to a,b,c,d,e,f,g
reg [3:0] expected;  // expected value of 'segout'
integer segint;      // 'setout' of type integer

// Compute integer value of 7-segment display every time the value changes.
always @ (a, b, c, d, e, f, g)
begin : SEGMENT_TO_INTEGER
    segout = seg2integer(a, b, c, d, e, f, g);
    segint = segout;
end

// Test program, i.e., apply logic values to input ports of e74FSM, and
// check output values of e74FSM with expected values, and gives an error
// message if any mismatch is found.
// Hence, this is a self-checking testbench.
initial
begin : TEST_PROGRAM
    // Declare the followings as local if we do not need them in waveform.
    integer index, mod_index;
    reg [3:0] expected_led_values [0:N-1];

    // parameters for timeformat is:  unit (-9 means ns), digits after dot,
    // string after $time, minimum string length.
    $timeformat(-9, 0, " ns", 6);

    // Monitor logic values when any event exists on the listed signals.
    // Uncomment the following 2 lines if you want to monitor all signals
    // every time an event of a signal has been found.
    // $monitor("t=%0t: r=%b, ce=%b, clk=%b, seg=%b%b%b%b%b%b%b (%0d)",
    //          $time, RESET, CE, CLK, a, b, c, d, e, f, g, segout);

    // Setup expected values.
    for (index = 0 ; index < N ; index = index + 1) begin
        mod_index = index % 7;
        case (mod_index)
            0 : expected_led_values[index] = 3;
            1 : expected_led_values[index] = 2;
            2 : expected_led_values[index] = 1;
            default : expected_led_values[index] = mod_index + 1;
        endcase
    end

    // Set initial values of inputs to e74FSM:
    // Set initial value of CLK, disable CE, and enable RESET.
    CLK = 1'b0;
    CE = 1'b0;
    RESET = 1'b1;
    expected = 0;
    # CLOCK_PERIOD;

    // Check if initial state of counter is 0.
    // Note that $time is system task which represents current simulation time.
    $display("Check if RESET works at time %0t.", $time);
    if (segout === expected) begin
        $display("Yep, RESET works.");
    end else begin
        $error("%0t: Counter output shall be 0 on reset, but the value = %4b.",
               $time, segout);
    end

    // Release reset. Output shall be 0 as long as CE = 0.
    RESET = 1'b0;
    # (2*CLOCK_PERIOD);

    $write("Check if counter state is still 0");
    $display(" after RESET has been released at %0t.", $time);
    if (segout === expected) begin
        $display("Yep, counter state is still 0 since CE = 1'b0.");
    end else begin
        $error("%0t: Counter output shall be 0 since CE = 1'b0.", $time,
               " But the counter value = %4b.", segout);
    end

    // Now, give count enable so that counter starts counting.
    CE = 1'b1;
    $display("Now, CE = 1'b%b at %0t.", CE, $time);

    // Check LED (counter output) values at falling edges of CLK.
    $display("Checking LED outputs at every falling edge of CLK.");
    for (index = 0 ; index < N ; index = index + 1) begin
        // Update expected values at rising edges since LED output values are
        // updated at rising edges.
        @ (posedge CLK);
        expected = expected_led_values[index];
        if (index == 0)
            $display("%0t: The 1st rising edge of CLK after CE becomes 1'b1.",
                     $time);

        // Observe the LED outputs at falling edges to allow sufficient
        // propagation delays.
        @ (negedge CLK);
        if (segout === expected) begin
            $display("%0t: LED output = %0d at falling edge of CLK.",
                     $time, segout);
        end else begin
            $error("%0t: LED output mismatch: LED value = %4b,",
                   $time, segout, " expected = %4b.", expected);
        end
    end
end
endmodule

