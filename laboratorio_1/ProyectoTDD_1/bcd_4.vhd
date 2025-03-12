library IEEE; use IEEE.STD_LOGIC_1164.all;

-- archivo para pasar los numero de binario a hexadecimal para poder representarlos en el 7segmentos o fpga

entity bcd_4 is 
	port( bits: in STD_LOGIC_VECTOR(3 downto 0);
	seg0 : out STD_LOGIC_VECTOR(6 downto 0));
	
end;

architecture behavioral of bcd_4 is 
	begin
	process(bits)
    begin
        case bits is
            when "0000" => seg0 <= "0000001";
            when "0001" => seg0 <= "1001111";
            when "0010" => seg0 <= "0010010";
            when "0011" => seg0 <= "0000110";
            when "0100" => seg0 <= "1001100";
            when "0101" => seg0 <= "0100100";
            when "0110" => seg0 <= "0100000";
            when "0111" => seg0 <= "0001111";
            when "1000" => seg0 <= "0000000";
            when "1001" => seg0 <= "0000100";
            when "1010" => seg0 <= "0001000";
            when "1011" => seg0 <= "1100000";
            when "1100" => seg0 <= "0110001";
            when "1101" => seg0 <= "1000010";
            when "1110" => seg0 <= "0110000";
            when "1111" => seg0 <= "0111000";
            when others  => seg0 <= "1111111";
        end case;
    end process;
end behavioral;
