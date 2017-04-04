OFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@
Objects=src/main.o src/global.o \
	src/fetch/checker.o src/fetch/defaultspecbuf.o src/fetch/dynamicspecbuf.o src/fetch/fetchOpen.o src/fetch/fetchPipe.o src/fetch/file.o src/fetch/hashTable.o \
	src/fetch/savespecbuf.o src/fetch/sequencer.o src/fetch/site.o src/fetch/specbuf.o \
	src/interf/defaultuseroutput.o src/interf/input.o src/interf/mirrorsaveuseroutput.o \ 
	src/interf/output.o src/interf/saveuseroutput.o src/interf/statsuseroutput.o src/interf/useroutput.o \	
	src/utils/connexion.o src/utils/debug.o src/utils/hashDup.o src/utils/histogram.o src/utils/mypthread.o src/utils/PersistentFifo.o src/utils/string.o \
	src/utils/text.o src/utils/url.o src/utils/webserver.o

ojsAdns=adns/check.o adns/event.o adns/check.o adns/general.o adns/parse.o adns/poll.o adns/query.o adns/reply.o adns/setup.o adns/check.o adns/transmit.o adns/type.o     
Headers=$(wildcard src/*.h) $(wildcard src/*/*.h)  $(wildcard adns/*.h)
 

cuibin:$(Objects)
	$(OFunc)

$(filter %.o,$(Objects)):%.o:%.cc $(Headers)
	$(CFunc)
	
$(filter %.o,$(ojsAdns)):%.o:%.c $(Headers)
	$(CFunc)

.PHONY:clean
clean:
	-rm cuibin $(Objects) $(ojsAdns) 
