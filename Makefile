CC=g++
CFLAGS=-std=c++17 -O2 -fPIC
.PHONY: all clean install uninstall

all: cowsay_my

libcowsay.so: Cow.o Cloud.o ASCIIPicture.o
	$(CC) -shared -o libcowsay.so Cow.o Cloud.o ASCIIPicture.o

clean:
	rm *.o libcowsay.so cowsay_my
install:
	install ./cowsay_my /usr/local/bin
	mkdir -p /usr/local/lib/cowsay_my
	install ./libcowsay.so /usr/local/lib/cowsay
	mkdir -p /usr/share/cowsay_my
	cp -r cows /usr/share/cowsay_my/
	cp -r clouds /usr/share/cowsay_my/
uninstall:
	rm /usr/local/bin/cowsay_my
	rm /usr/local/lib/cowsay/libcowsay.so
	rm -r /usr/share/cowsay_my/cows
	rm -r /usr/share/cowsay_my/clouds
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

cowsay_my: main.o Parser.o Field.o libcowsay.so
	$(CC) $(CFLAGS) -o cowsay_my main.o Parser.o Field.o -L. -lcowsay -Wl,-rpath,/usr/local/lib/cowsay_my
