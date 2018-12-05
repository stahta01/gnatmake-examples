.PHONY: all
all:
	mkdir -p ./lib
	g++ -c i_am_cpp.cpp
	g++ -c i_am_adaInterface.cpp
	ar r ./lib/cppStatic.a *.o
	gnatmake Main_App
#	gnatmake main -largs i_am_cpp.o i_am_adaInterface.o --LINK=g++

.PHONY: clean
clean:
	rm -rf *.o lib

