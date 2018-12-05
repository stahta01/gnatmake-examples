.PHONY: all
all:
	mkdir -p ./lib
	g++ -c i_am_cpp.cpp
	g++ -c i_am_adaInterface.cpp
	ar r ./lib/libcppStatic.a *.o
	rm *.o  # to make sure we're linking to the static library
	gnatmake -c main.adb
	gnatbind -E main.ali
	gnatlink -o main main.ali -L./lib -lcppStatic --LINK=g++

.PHONY: clean
clean:
	rm -rf *.ali *.o lib main

