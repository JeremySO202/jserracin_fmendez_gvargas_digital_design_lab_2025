library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sum_4_tb is
end sum_4_tb;

architecture behavior of sum_4_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component sum_4
        port(
            a, b : in STD_LOGIC_VECTOR(3 downto 0);
            cout : out STD_LOGIC;
            y    : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Signals for testbench
    signal a_tb, b_tb : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal cout_tb    : STD_LOGIC;
    signal y_tb       : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: sum_4 port map (
        a    => a_tb,
        b    => b_tb,
        cout => cout_tb,
        y    => y_tb
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test Case 1
        a_tb <= "0000";
        b_tb <= "0000";
        wait for 10 ns;
        
        -- Test Case 2
        a_tb <= "0001";
        b_tb <= "0001";
        wait for 10 ns;
        
        -- Test Case 3
        a_tb <= "0011";
        b_tb <= "0001";
        wait for 10 ns;
        
        -- Test Case 4
        a_tb <= "1010";
        b_tb <= "0101";
        wait for 10 ns;
        
        -- Test Case 5
        a_tb <= "1111";
        b_tb <= "1111";
        wait for 10 ns;
        
        -- Stop Simulation
        wait;
    end process;

end behavior;