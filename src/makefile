CCFiles:=$(wildcard *.cc utils/*.cc ) interf/input.cc interf/output.cc interf/useroutput.cc \
  fetch/site.cc  fetch/sequencer.cc fetch/hashTable.cc fetch/checker.cc fetch/file.cc fetch/fetchOpen.cc fetch/fetchPipe.cc
HFiles:=$(wildcard *.h utils/*.h fetch/*.h interf/*.h) 
Objs:=$(CCFiles:%.cc=%.o)


ifeq ($(debug),true)
LCPP=g++ -pthread -lpthread -lresolv -lnsl -g
CCPP=g++ -w -Wno-deprecated -Wall -O3 -D_REENTRANT -g
else
LCPP=g++ -pthread -lpthread -lresolv -lnsl
CCPP=g++ -w -Wno-deprecated -Wall -O3 -D_REENTRANT
endif

cuibin:$(Objs)
	$(LCPP)  -o $@ $^ ../adns/libadns.a

$(Objs):%.o:%.cc $(HFiles)
	$(CCPP)  -c $< -o $@ -I- -I. -I../adns -ladns

.PHONY:clean
clean:
	rm -f cuibin $(Objs)



