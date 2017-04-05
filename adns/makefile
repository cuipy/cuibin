CFiles=$(wildcard *.c)
HFiles=$(wildcard *.h)
Objs=$(CFiles:%.c=%.o)

libadns.a:$(Objs)
	ar -cq $@ $^

$(Objs):%.o:%.c $(HFiles)
	gcc -w -O3 -Wall -D_REENTRANT  -c -o $@ $<

.PHONY:clean

clean:
	-rm libadns.a $(Objs)
