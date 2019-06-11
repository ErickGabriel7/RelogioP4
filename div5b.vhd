--Autor: Erick Gabriel
-- Divisor de frequencias de 5 bits
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY div5b IS
PORT( rst,clk : IN  STD_LOGIC;
      q       : OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END div5b;

ARCHITECTURE rtl OF div5b IS
SIGNAL tq : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
   PROCESS (rst,clk,tq) 
   BEGIN
     IF rst = '0' THEN
       tq <= (OTHERS => '0');
     ELSE     
        IF clk'EVENT AND clk = '0' THEN
           tq(0) <= NOT tq(0);
        END IF;  
         IF tq(0)'EVENT AND tq(0)='0' THEN
           tq(1) <= NOT tq(1);
         END IF;
         IF tq(1)'EVENT AND tq(1)='0' THEN
           tq(2) <= NOT tq(2);
         END IF;
         IF tq(2)'EVENT AND tq(2)='0' THEN
           tq(3) <= NOT tq(3);
         END IF;
         IF tq(3)'EVENT AND tq(3)='0' THEN
           tq(4) <= NOT tq(4);
         END IF;
     END IF;
   END PROCESS;
   q <= tq;
END rtl;	