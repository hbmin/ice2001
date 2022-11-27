-------------------------------------------------------------------------
--
--  Copyright (c) 2022 by Hyoung Bok Min, All rights reserved.
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/#GPL>.
--
--
--  File name  : hw6tb.vhd
--  Written by : Min, Hyoung Bok, Professor
--               School of Electrical Engineering
--               Sungkyunkwan University
--  Written on : Nov. 08, 2022
--  version    : 1.0
--  Design     : Testbench for circuit under test (e74FSM) in hw6.vhd.
--               e74FSM is a 3-bit Counter with 7-segment Driver.
--
--  Modification History:
--      * v1.0: Nov. 08, 2022  by Hyoung Bok Min
--        version 1.0 released.
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- We'll use standard text I/O
use std.textio.all;

entity hw6tb is
end;

architecture hw6tb_arch of hw6tb is
    -- Periods
    constant CLOCK_PERIOD : time := 10 ns;
    constant HALF_CLOCK_PERIOD : time := CLOCK_PERIOD/2;

    -- Wires connected to CUT (circuit under test)
    signal CLK, CE, RESET : std_logic;
    signal a, b, c, d, e, f, g : std_logic;

    -- LED output value of the counter
    -- These are for observation at waveform viewer.
    signal led_value, expected_led_value : integer;

    -- Circuit under test
    component e74FSM
        port (CLK, CE, RESET : in std_logic;
              a, b, c, d, e, f, g : out std_logic);
    end component;

    -------------
    -- Function for conversion from std_logic to character
    -------------
    function to_str ( inval : std_logic ) return character is
    begin
        return std_logic'image(inval)(2);
    end;

    -------------
    -- Function to convert 7-segment display value to an integer
    -------------
    function seg2integer (a, b, c, d, e, f, g : std_logic) return integer is
        variable segval : std_logic_vector (6 downto 0);
        variable outval : integer;
    begin
        segval := (a, b, c, d, e, f, g);
        case segval is
            when "0000001" =>  outval := 0;
            when "1001111" =>  outval := 1;
            when "0010010" =>  outval := 2;
            when "0000110" =>  outval := 3;
            when "1001100" =>  outval := 4;
            when "0100100" =>  outval := 5;
            when "1100000" =>  outval := 6;
            when "0001111" =>  outval := 7;
            when "1111110" =>  outval := 10;    -- invalid display value
            when others =>     outval := 11;    -- impossible value
        end case;
        return outval;
    end;

    -------------
    -- Print current simulation time with a message.
    -------------
    procedure print_time (msg : in string; add_time : in boolean := true) is
        variable buff : line;
        constant at : string (1 to 4) := " at ";
    begin
        write(buff, msg);
        if add_time then
            write(buff, at);
            write(buff, NOW);      -- NOW is current simulation time.
        end if;
        writeline(OUTPUT, buff);   -- OUTPUT means 'standard output' file.
    end;
begin
    -- Instantiation of CUT (circuit under test)
    U1 : e74FSM port map ( RESET => RESET, CLK => CLK, CE => CE,
                a => a, b => b, c => c, d => d, e => e, f => f, g => g);

    -- A clock generator of 100 MHz
    CLOCK_GENERATOR: process
    begin
        CLK <= '0';
        wait for HALF_CLOCK_PERIOD;
        CLK <= '1';
        wait for HALF_CLOCK_PERIOD;
    end process;

    -- Convert LED outputs to integer every time they changes.
    LED_OUTPUT_TO_INTEGER: process (a, b, c, d, e, f, g)
    begin
        led_value <= seg2integer (a, b, c, d, e, f, g);
    end process;

    -- Test program, i.e., apply logic values to inputs of e74FSM.
    -- This is self-checking testbench since this program compares outputs of
    -- the circuit e74FSM witb expected values, and give error messages
    -- if any mismatch is found.
    TEST_PROGRAM : process
        -- Expected outputs of the counter
        type intvec is array (positive range <>) of integer;
        constant N : integer := 20;    -- number of test cases
        constant expected_states : intvec (1 to N) :=
                 (3, 2, 1, 4, 5, 6, 7, 3, 2, 1, 4, 5, 6, 7, 3, 2, 1, 4, 5, 6);
    begin
        -- Disable CE and enable RESET.
        CE <= '0';
        RESET <= '1';
        expected_led_value <= 0;

        -- Check if LED (or counter) output value is 0 at reset state.
        wait for CLOCK_PERIOD;
        print_time("Check if RESET works");
        if led_value = expected_led_value then
            print_time("Yep, RESET works.", false);
        else
            -- You may use 'assert' if you do not need 'if' part.
            report "LED value shall be 0 on reset. LED value : "
                   & integer'image(led_value)
            severity error;
        end if;

        -- Release RESET. but the counter (or LED) shall hold 0 since CE = '0'.
        RESET <= '0';
        wait for (2*CLOCK_PERIOD);
        print_time("Check if counter state is still 0 "
                   & "after RESET has been released");
        if led_value = expected_led_value then
            print_time("Yep, counter state is still 0 after RESET " &
                       "since CE = '0'.", false);
        else
            -- You may use assertion if you do not need 'if' part.
            report "LED value shall be 0 on CE = '0'. LED value : "
                   & integer'image(led_value)
            severity error;
        end if;

        -- Now, CE becomes '1' for counting after waiting for delta delay.
        CE <= '1';
        wait for 0 ns;
        print_time("Now, CE = " & std_logic'image(CE));

        -- We'll observe LED outputs for every falling edge of CLK.
        print_time("We'll check counter states at every falling edge of clock.",
                   false);
        for index in 1 to N loop
            -- Update expected values at rising edges since the LED outputs
            -- are updated at the rising edges.
            wait until rising_edge(CLK);
            expected_led_value <= expected_states(index);
            if index = 1 then
                print_time("The 1st rising edge of CLK after CE becomes '1'");
            end if;

            -- Observe the LED outputs at falling edges to allow sufficuent
            -- propagation delays.
            wait until falling_edge(CLK);
            if led_value = expected_led_value then
                print_time("LED value = " & integer'image(led_value)
                           & " at falling edge of CLK");
            else
                -- You may use assertion if you do not need 'if' part.
                report "LED value at circuit : "
                       & integer'image(led_value)
                       & ", expected LED value : "
                       & integer'image(expected_led_value)
                severity error;
            end if;
        end loop;
        wait;
    end process;

    -- Report values when any of the signals in sensitivity list changes.
    REPORT_ON_CHANGE: process (RESET, CLK, CE, a, b, c, d, e, f, g)
        -- Change false to true if you want report logic values
        -- every time there is an event at the signals.
        constant do_report : boolean := false;
    begin
        if do_report = true then
            report "r=" & to_str(RESET) & " clk=" & to_str(CLK)
                   & " ce=" & to_str(CE)
                   & " seg=" & to_str(a) & to_str(b) & to_str(c) & to_str(d)
                   & to_str(e) & to_str(f) & to_str(g) & " ("
                   & integer'image(seg2integer(a, b, c, d, e, f, g)) & ")";
        end if;
    end process;
end;

