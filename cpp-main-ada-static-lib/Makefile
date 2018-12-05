all:
	g++ -c main.cpp
	gnatmake -c i_am_ada.adb
	gnatbind -Lelab -o elab.adb i_am_ada.ali
	gnatmake elab.adb
	ar cr libelab.a elab.o i_am_ada.o
	g++ main.o -o main -lelab -lgnat

