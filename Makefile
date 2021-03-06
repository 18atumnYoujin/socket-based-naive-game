.PHONY:run-client run-server clean tmp

all:server client

server:server.c common.h
	gcc -Wall -std=c11 server.c -o server -lpthread -ggdb

client:client.c common.h
	gcc -Wall -std=c11 client.c -o client -lpthread -ggdb

clean:
	rm server client

run-server:server client
	./server

run-client:server client
	./client

tmp:
	echo $(CFILES)
	echo $(filter,./front/front-main.c,$(CFILES))
