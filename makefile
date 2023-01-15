SRC :=$(wildcard *.c)
OBJS :=$(patsubst %.c, %, $(SRC))

MAKE_TARGETS := $(OBJS)


all:$(MAKE_TARGETS)

%:%.c
	clang -O3 -static  $< -o $@   -lm
	
clean:
	rm ./*.o 
