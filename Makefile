all:
	../../gbdk/bin/lcc -Wa-l -Wl-m -Wl-j -c -o main.o main.c
	../../gbdk/bin/lcc -Wa-l -Wl-m -Wl-j -o main.gb main.o