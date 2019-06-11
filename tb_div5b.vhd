--Autor: Erick Gabriel
-- Divisor de frequências de 5 bits
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tb_div5b IS
END tb_div5b;

ARCHITECTURE teste OF tb_div5b IS

COMPONENT div5b IS
PORT( rst,clk : IN  STD_LOGIC;
      q       : OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END COMPONENT;

CONSTANT dt            :  TIME := 10 ns;
SIGNAL rst,clk         :  STD_LOGIC;
SIGNAL q1, q2, q3, q4  :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL contador        :  STD_LOGIC_VECTOR(19 DOWNTO 0);

BEGIN 
  PROCESS
    BEGIN
      clk <= '0' ; WAIT FOR dt/2;
      clk <= '1' ; WAIT FOR dt/2;
    END PROCESS;
   PROCESS
     BEGIN
       rst <= '0' ; WAIT FOR dt;
       rst <= '1' ; WAIT;
     END PROCESS;
   
    u0: div5b PORT MAP(rst => rst, clk => clk  , q => q1);
    u1: div5b PORT MAP(rst => rst, clk => q1(4), q => q2);
    u2: div5b PORT MAP(rst => rst, clk => q2(4), q => q3);
    u3: div5b PORT MAP(rst => rst, clk => q3(4), q => q4);
    contador <= q4 & q3 & q2 & q1;
END teste;

