--Autor: Erick Gabriel

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ContaSinc IS 
PORT (rst,clk,ctrl, habilita : IN  STD_LOGIC;
      cnt          : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ContaSinc;

ARCHITECTURE imp OF ContaSinc IS

SIGNAL conta, max : INTEGER RANGE 0 TO 9;


BEGIN
   max <= 9 WHEN ctrl = '0' ELSE
          5;
   PROCESS(clk, rst, max, habilita)
   BEGIN
   IF habilita = '1' THEN
     IF rst = '0'THEN
        conta <= 0;
     ELSIF clk'EVENT AND clk='1' THEN
        IF conta < max THEN
           conta <= conta +1;
        ELSE
           conta <= 0;
        END IF;
     END IF;
   END IF;
   END PROCESS;
   cnt <= STD_LOGIC_VECTOR(TO_UNSIGNED(conta,4));
END imp;
