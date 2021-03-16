make:
	ghdl -a --std=93c --ieee=synopsys\
		 utils_pkg.vhdl \
		 time_keeper.vhdl \
		 top_level.vhdl \
		 top_level_tb.vhdl 
	ghdl -e top_level_tb

run:
	ghdl -r top_level_tb --wave=top_level_tb.ghw

view:
	gtkwave top_level_tb.ghw

clean:
	rm *.cf *.ghw
	
