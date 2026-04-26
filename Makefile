CC=g++
CFLAGS=-std=c++17 -O2 -lstdc++fs
.PHONY: all clean install uninstall

all: cowsay

clean:
	rm *.o cowsay
install:
	install ./cowsay /usr/local/bin
	mkdir -p /usr/share/cowsay
	cp -r cows /usr/share/cowsay/
	cp -r clouds /usr/share/cowsay/
uninstall:
	rm /usr/local/bin/cowsay
	rm -r /usr/share/cowsay/cows
	rm -r /usr/share/cowsay/clouds
main.o: main.cpp Parser.hpp Field.hpp Cow.hpp Cloud.hpp ASCIIPicture.hpp
	$(CC) $(CFLAGS) -c main.cpp -o main.o

Parser.o: Parser.cpp Parser.hpp
	$(CC) $(CFLAGS) -c Parser.cpp -o Parser.o

Field.o: Field.cpp Field.hpp Cow.hpp Cloud.hpp ASCIIPicture.hpp
	$(CC) $(CFLAGS) -c Field.cpp -o Field.o

Cow.o: Cow.cpp Cow.hpp ASCIIPicture.hpp
	$(CC) $(CFLAGS) -c Cow.cpp -o Cow.o

Cloud.o: Cloud.cpp Cloud.hpp ASCIIPicture.hpp
	$(CC) $(CFLAGS) -c Cloud.cpp -o Cloud.o

ASCIIPicture.o: ASCIIPicture.cpp ASCIIPicture.hpp
	$(CC) $(CFLAGS) -c ASCIIPicture.cpp -o ASCIIPicture.o

cowsay: main.o Parser.o Field.o Cow.o Cloud.o ASCIIPicture.o
	$(CC) $(CFLAGS) main.o Parser.o Field.o Cow.o Cloud.o ASCIIPicture.o -o cowsay
