SRC :=$(wildcard *.c)
OBJS :=$(patsubst %.c, %. $(SRC))

MAKE_TARGETS := $(OBJS)


all:$(MAKE_TARGETS)

%.out:%.c
	clang -O3 -static  $< -o $@   -lm
	
clean:
	rm ./*.o 
