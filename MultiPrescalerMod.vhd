-- G. Gora
-- MSWSiS 2016


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MultiPrescaler is
	port(
		clk : in std_logic;
		reset_n : in std_logic := '1';
		
		clk_025Hz : out std_logic;
		clk_05Hz : out std_logic;
		clk_1Hz : out std_logic;
		clk_10Hz : out std_logic;
		clk_100Hz : out std_logic;
		clk_1kHz : out std_logic;
		clk_100kHz : out std_logic
	);
end entity;


architecture MultiPrescaler of MultiPrescaler is

	signal cnt025hz : unsigned(27 downto 0) := (others => '0');
	signal cnt05hz : unsigned(27 downto 0) := (others => '0');
	signal cnt1hz : unsigned(27 downto 0) := (others => '0');
	signal cnt10hz : unsigned(23 downto 0) := (others => '0');
	signal cnt100hz : unsigned(19 downto 0) := (others => '0');
	signal cnt1khz : unsigned(15 downto 0) := (others => '0');
	signal cnt100khz : unsigned(9 downto 0) := (others => '0');
	
	signal clk025hz, clk05hz, clk1hz, clk10hz, clk100hz, clk1khz, clk100khz : std_logic := '0';
	
	constant CLK025HZ_MAX : unsigned(27 downto 0) := x"BEBC1FF";
	constant CLK025HZ_P : unsigned(27 downto 0) := x"5F5E0FF";
	
	constant CLK05HZ_MAX : unsigned(27 downto 0) := x"5F5E0FF";
	constant CLK05HZ_P : unsigned(27 downto 0) := x"2FAF07F";
	
	constant CLK1HZ_MAX : unsigned(27 downto 0) := x"2FAF07F";
	constant CLK1HZ_P : unsigned(27 downto 0) := x"17D783F";
	
	constant CLK10HZ_MAX : unsigned(23 downto 0) := x"4C4B3F";
	constant CLK10HZ_P : unsigned(23 downto 0) := x"26259F";
	
	constant CLK100HZ_MAX : unsigned(19 downto 0) := x"7A11F";
	constant CLK100HZ_P : unsigned(19 downto 0) := x"3D08F";
	
	constant CLK1KHZ_MAX : unsigned(15 downto 0) := x"C34F";
	constant CLK1KHZ_P : unsigned(15 downto 0) := x"61A7";
	
	constant CLK100KHZ_MAX : unsigned(9 downto 0) := "0111110011";
	constant CLK100KHZ_P : unsigned(9 downto 0) := "0011111001";

begin


	process(clk, reset_n)
	begin
		if(reset_n = '0')then
			cnt025hz <= (others => '0');
		elsif rising_edge(clk) then
			if(cnt025hz < CLK025HZ_MAX)then
				cnt025hz <= cnt025hz + 1;
			else
				cnt025hz <= (others => '0');
			end if;
		end if;
	end process;
	
	
	process(clk, reset_n)
	begin
		if(reset_n = '0')then
			cnt05hz <= (others => '0');
		elsif rising_edge(clk) then
			if(cnt05hz < CLK05HZ_MAX)then
				cnt05hz <= cnt05hz + 1;
			else
				cnt05hz <= (others => '0');
			end if;
		end if;
	end process;
	

	process(clk, reset_n)
	begin
		if(reset_n = '0')then
			cnt1hz <= (others => '0');
		elsif rising_edge(clk) then
			if(cnt1hz < CLK1HZ_MAX)then
				cnt1hz <= cnt1hz + 1;
			else
				cnt1hz <= (others => '0');
			end if;
		end if;
	end process;

	
	process(clk, reset_n)
	begin
		if(reset_n = '0')then
			cnt10hz <= (others => '0');
		elsif rising_edge(clk) then
			if(cnt10hz < CLK10HZ_MAX)then
				cnt10hz <= cnt10hz + 1;
			else
				cnt10hz <= (others => '0');
			end if;
		end if;
	end process;
	
	
	process(clk, reset_n)
	begin
		if(reset_n = '0')then
			cnt100hz <= (others => '0');
		elsif rising_edge(clk) then
			if(cnt100hz < CLK100HZ_MAX)then
				cnt100hz <= cnt100hz + 1;
			else
				cnt100hz <= (others => '0');
			end if;
		end if;
	end process;
	
	
	process(clk, reset_n)
	begin
		if(reset_n = '0')then
			cnt1khz <= (others => '0');
		elsif rising_edge(clk) then
			if(cnt1khz < CLK1KHZ_MAX)then
				cnt1khz <= cnt1khz + 1;
			else
				cnt1khz <= (others => '0');
			end if;
		end if;
	end process;
	
	
	process(clk, reset_n)
	begin
		if(reset_n = '0')then
			cnt100khz <= (others => '0');
		elsif rising_edge(clk) then
			if(cnt100khz < CLK100KHZ_MAX)then
				cnt100khz <= cnt100khz + 1;
			else
				cnt100khz <= (others => '0');
			end if;
		end if;
	end process;
	
	
	clk025hz <= '1' when(cnt025hz > CLK025HZ_P) else '0';
	clk05hz <= '1' when(cnt05hz > CLK05HZ_P) else '0';
	clk1hz <= '1' when(cnt1hz > CLK1HZ_P) else '0';
	clk10hz <= '1' when(cnt10hz > CLK10HZ_P) else '0';
	clk100hz <= '1' when(cnt100hz > CLK100HZ_P) else '0';
	clk1khz <= '1' when(cnt1khz > CLK1KHZ_P) else '0';
	clk100khz <= '1' when(cnt100khz > CLK100KHZ_P) else '0';
	
	
	process(clk, reset_n)
	begin
		if(reset_n = '0')then
			clk_025Hz <= '0';
			clk_05Hz <= '0';
			clk_1Hz <= '0';
			clk_10Hz <= '0';
			clk_100Hz <= '0';
			clk_1kHz <= '0';
			clk_100kHz <= '0';
		elsif rising_edge(clk) then
			clk_025Hz <= clk025Hz;
			clk_05Hz <= clk05Hz;
			clk_1Hz <= clk1Hz;
			clk_10Hz <= clk10Hz;
			clk_100Hz <= clk100Hz;
			clk_1kHz <= clk1kHz;
			clk_100kHz <= clk100kHz;
		end if;
	end process;
	

end architecture;
