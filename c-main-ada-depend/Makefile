all:
	gcc -c main.c
	gnatmake -c i_am_ada.adb
	gnatbind -n i_am_ada.ali
	gnatlink i_am_ada.ali main.o -o main
