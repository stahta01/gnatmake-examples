all:
	g++ -c main.cpp
	gnatmake -c i_am_ada.adb
	gnatbind -LadaStatic -o adaStatic.adb i_am_ada.ali
	gnatmake adaStatic.adb
	ar cr libadaStatic.a adaStatic.o i_am_ada.o
	ls -la
	g++ main.o -o main -L. -ladaStatic -lgnat

