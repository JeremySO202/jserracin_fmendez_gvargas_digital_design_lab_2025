library IEEE; use IEEE.STD_LOGIC_1164.ALL;

--unión del bcd y suma
entity problema_2 is
	port (n1, n2 : in STD_LOGIC_VECTOR(3 downto 0);
	 
	 cout : out STD_LOGIC;
	 
	 y : out STD_LOGIC_VECTOR(6 downto 0));
	 
	
	end problema_2;
	
architecture behavioral of problema_2 is 

	--instancias de la "clase"
	component sum_4 
		port(a, b: in STD_LOGIC_VECTOR(3 downto 0);
		
		cout: out STD_LOGIC;
		y : out STD_LOGIC_VECTOR(3 downto 0));
		
	end component;
	
	--instancias de la "clase"
	component bcd_4 
		port( bits: in STD_LOGIC_VECTOR(3 downto 0);
		seg0 : out STD_LOGIC_VECTOR(6 downto 0));
		
	end component;
	
	--variables temporales
	signal s: STD_LOGIC_VECTOR(3 downto 0);
	signal vout : STD_LOGIC;
	
	begin
	
	parte_sum: sum_4
		port map(
			a => n1,
			b => n2,
			cout => vout,
			y => s
			);
			
		cout <= vout;	
		
	parte_bcd: bcd_4
        port map (
            bits => s,  
            seg0 => y
        );
		
end architecture behavioral; 
	