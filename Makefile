CC     = g++
CFLAGS = -g -D_GNU_SOURCE -Wall
LFLAGS =
OFILES = collect.o process.o util.o
HEADERS = clink.h
EXECUTABLE = clink

FILES = COPYRIGHT Makefile clink.doc clink.h collect.c process.c util.c

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -Ithird_party/m-lab.libraries/trunk/include -Wno-write-strings

all: $(EXECUTABLE)

$(EXECUTABLE): $(OFILES)
	$(CC) $(LFLAGS) -o clink $(OFILES) \
          -Lthird_party/m-lab.libraries/trunk/lib \
          -Lthird_party/m-lab.libraries/trunk/third_party/json-cpp/lib \
          -lm -lmlab -ljson-cpp

tar:
	rm -f clink.1.0/*
	cp $(FILES) clink.1.0
	tar -cvf clink.1.0.tar clink.1.0
	tar -czf clink.1.0.tar.gz clink.1.0

clean:
	rm -f $(OFILES) $(EXECUTABLE)
