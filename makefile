.PHONY:run-client run-server clean tmp

all:server client

server:server.cpp common.h func.h constants.h server.h makefile
	g++ -Wall -std=c++11 -O3 server.cpp -o server -pthread -ggdb

client:client.cpp common.h func.h constants.h makefile
	g++ -Wall -std=c++11 client.cpp -o client -pthread -ggdb

clean:
	rm server client

run-server:server client
	./server

run-client:server client
	./client

tmp:
	echo $(CFILES)
	echo $(filter,./front/front-main.c,$(CFILES))
