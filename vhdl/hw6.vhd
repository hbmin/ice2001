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
--  File name  : hw6.vhd
--  Written by : Min, Hyoung Bok, Professor
--               School of Electrical Engineering
--               Sungkyunkwan University
--  Written on : Nov. 08, 2022
--  version    : 1.0
--  Design     : 3-bit Counter with 7-segment Display Driver.
--
--  Modification History:
--      * v1.0: Nov. 08, 2022  by Hyoung Bok Min
--        version 1.0 released.
--
-------------------------------------------------------------------------


----------------------
-- Entity : e74FSM
--
-- Description: 3-bit Counter with 7-segment display driver at its output.
----------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity e74FSM is
    port (
        -- Inputs:
        CLK,                    -- System Clock
        CE,                     -- Clock Enable, active high
        RESET : in std_logic;   -- Asynchronous Reset, active high
        -- Outputs: 7-segments
        a, b, c, d, e, f, g : out std_logic
    );
end entity e74FSM;

----------------------
-- Architecture : e74FSM_arch
-- of Entity : e74FSM
--
-- Description : Structural model of e74FSM.
----------------------
architecture e74FSM_arch of e74FSM is
    -- 3-bit Counter with Clock Enable
    component COUNTER3
        port (CLK, CE, RESET: in std_logic;
              Q : out std_logic_vector (2 downto 0));
    end component;
    -- 3-bit binary to 7-segment display converter
    component BIN2SEG
        port (Q : in std_logic_vector (2 downto 0);
              a, b, c, d, e, f, g : out std_logic);
    end component;

    -- Outputs of 3-bit counter
    signal Q : std_logic_vector (2 downto 0);
begin
    U1 : COUNTER3 port map(RESET => RESET, CLK => CLK, CE => CE, Q => Q);
    U2 : BIN2SEG  port map(Q => Q, a => a, b => b, c => c,
                           d => d, e => e, f => f, g => g);
end architecture e74FSM_arch;


----------------------
-- Entity : COUNTER3
--
-- Description: 3-bit Counter with CE (Clock Enable), whose counting sequence
--              is 0->3->2->1->4->5->6->7->3->2->1->4->5->6 ... when CE = 1.
--              Otherwise, counter holds the counting state.
----------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity COUNTER3 is
    port (
        -- Inputs:
        CLK,                   -- System Clock
        CE,                    -- Clock Enable, active high
        RESET: in std_logic;   -- Asynchronous Reset, active high
        -- Outputs:
        Q : out std_logic_vector (2 downto 0)
    );
end entity COUNTER3;

----------------------
-- Architecture : COUNTER3_beh
-- of Entity : COUNTER3
--
-- Description : Behavioral model of COUNTER3.
--               Counting sequence is as given at entity comment.
-- Note: function to_x01z() converts each of 9 values to 4 values (x, 0, 1, z),
--       and it is defined in std_logic_1164 package of IEEE library.
----------------------
architecture COUNTER3_beh of COUNTER3 is
    signal Qint : std_logic_vector (2 downto 0);
begin
    Q <= Qint;
    COUNT: process (CLK, RESET)
    begin
       if to_x01z(RESET) = '1' then
           Qint <= "000";
       elsif rising_edge(CLK) then
           if to_x01z(CE) = '1' then
               case Qint is
                   when "000" =>  Qint <= "011";
                   when "001" =>  Qint <= "100";
                   when "010" =>  Qint <= "001";
                   when "011" =>  Qint <= "010";
                   when "100" =>  Qint <= "101";
                   when "101" =>  Qint <= "110";
                   when "110" =>  Qint <= "111";
                   when "111" =>  Qint <= "011";
                   when others => Qint <= "000";
               end case;
           end if;
       end if;
    end process;
end architecture COUNTER3_beh;


----------------------
-- Entity : BIN2SEG
--
-- Description: 3-bit binary to 7-segment display converter.
----------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity BIN2SEG is
    port (
        -- Inputs:
        Q : in std_logic_vector (2 downto 0);   -- 3-bit binary number
        -- Outputs:
        a, b, c, d, e, f, g : out std_logic     -- active low
    );
end entity BIN2SEG;

----------------------
-- Architecture : BIN2SEG_beh
-- of Entity : BIN2SEG
--
-- Description : Behavioral model of BIN2SEG, which is 3-bit binary to
--               7-segment converter.
--               The 7-segment display is active low.
----------------------
architecture BIN2SEG_beh of BIN2SEG is
    signal segments : std_logic_vector (6 downto 0);
begin
    (a, b, c, d, e, f, g) <= segments;
    CONVERT: process (Q)
    begin
        case Q is                   --  abcdefg
            when "000" =>  segments <= "0000001";
            when "001" =>  segments <= "1001111";
            when "010" =>  segments <= "0010010";
            when "011" =>  segments <= "0000110";
            when "100" =>  segments <= "1001100";
            when "101" =>  segments <= "0100100";
            when "110" =>  segments <= "1100000";
            when "111" =>  segments <= "0001111";
            when others => -- Turn on 'g' segment only if invalid input
                           segments <= "1111110";
        end case;
    end process;
end architecture BIN2SEG_beh;

