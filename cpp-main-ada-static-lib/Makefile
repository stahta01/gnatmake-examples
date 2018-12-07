all:
	g++ -c main.cpp
	gnatmake -c i_am_ada.adb
	gnatbind -Lelaborate -o elaborate.adb i_am_ada.ali
	gnatmake elaborate.adb
	ar cr libadaStatic.a elaborate.o i_am_ada.o
	rm -f elaborate.* *.ali i_am_ada.o  # ensure linkage to .a
	g++ main.o -o main -L. -ladaStatic -lgnat
