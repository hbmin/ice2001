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
 *  File name  : hw6.v
 *  Written by : Min, Hyoung Bok, Professor
 *               School of Electrical Engineering
 *               Sungkyunkwan University
 *  Written on : Nov. 08, 2022
 *  version    : 1.0
 *  Design     : 3-bit Counter with 7-segment Display Driver (active low).
 *
 *  Modification History:
 *      * v1.0: Nov. 08, 2022  by Hyoung Bok Min
 *        version 1.0 released.
 *
 -------------------------------------------------------------------------*/


/*----------------------
 *  Module : e74FSM
 *
 *  Description: 3-bit Counter with 7-segment display driver at its output.
 *               This is a structural model.
 *---------------------*/
module e74FSM (
    input CLK,      // System Clock
          CE,       // Clock Enable, active high
          RESET,    // Asynchronous Reset, active high
    output a, b, c, d, e, f, g     // for 7 segment display
);

// wires connected to outputs of 3-bit counter
wire [2:0] Q;

COUNTER3 U1 (.RESET(RESET), .CLK(CLK), .CE(CE), .Q(Q));
BIN2SEG  U2 (.Q(Q), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));
endmodule


/*----------------------
 *  Module : COUNTER3
 *
 *  Description: 3-bit Counter with CE (Clock Enable).
 *               This is a behavioral model, and counting sequence is
 *               0->3->2->1->4->5->6->7->3->2->1->4 ... when CE = 1.
 ----------------------*/
module COUNTER3 (
    input CLK,       // System Clock
          CE,        // Clock Enable, active high
          RESET,     // Asynchronous Reset, active high
    output [2:0] Q   // 3-bit number output of this counter
);

// Qint is a signal to avoid that output signal Q is at input side.
// You may choose one of the following synthesis attributes for state encoding:
//     "default", "one-hot", "gray", "johnson", "compact".
// The "default" is "one-hot" if number of states is less than 15, otherwise,
//     it is "compact".
(* syn_encoding = "compact" *) reg [2:0] Qint;
assign Q = Qint;

// 3-bit Counter with active high CE and asynchronous active high RESET
always @ (posedge CLK or posedge RESET)
begin : COUNTER
    if (RESET == 1'b1) begin
       Qint <= 3'b000;
    end else begin
       if (CE == 1'b1) begin
           case (Qint)
               3'b000 :  Qint <= 3'b011;
               3'b001 :  Qint <= 3'b100;
               3'b010 :  Qint <= 3'b001;
               3'b011 :  Qint <= 3'b010;
               3'b100 :  Qint <= 3'b101;
               3'b101 :  Qint <= 3'b110;
               3'b110 :  Qint <= 3'b111;
               3'b111 :  Qint <= 3'b011;
               default : Qint <= 3'b000;
           endcase
       end
    end
end
endmodule


/*----------------------
 *  Module : BIN2SEG
 *
 *  Description: 3-bit binary to 7-segment display converter.
 *               The 7-segment display is active low.
 *               This is a behavioral model.
 ----------------------*/
module BIN2SEG (
    input [2:0] Q,                // 3-bit binary number
    output a, b, c, d, e, f, g    // inputs to 7-segment display
);

reg [6:0] segments;
assign {a, b, c, d, e, f, g} = segments;

always @ (Q)
begin : SEVEN_SEGMENT
    case (Q)                 // abcdefg
        3'b000 :  segments = 7'b0000001;
        3'b001 :  segments = 7'b1001111;
        3'b010 :  segments = 7'b0010010;
        3'b011 :  segments = 7'b0000110;
        3'b100 :  segments = 7'b1001100;
        3'b101 :  segments = 7'b0100100;
        3'b110 :  segments = 7'b1100000;
        3'b111 :  segments = 7'b0001111;
        default : segments = 7'b1111110;   // Turn on 'g' if invalid input
    endcase
end
endmodule

