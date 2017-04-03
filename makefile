OFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@ -I adns -I src

ObjsMain=src/main.o src/global.o 
ObjsFetch=src/fetch/checker.o src/fetch/fetchOpen.o src/fetch/fetchPipe.o src/fetch/file.o src/fetch/hashTable.o  src/fetch/sequencer.o src/fetch/site.o src/fetch/specbuf.o 
ObjsInterf=src/interf/input.o src/interf/output.o src/interf/useroutput.o
ObjsUtils=src/utils/connexion.o src/utils/debug.o src/utils/hashDup.o src/utils/histogram.o src/utils/mypthread.o src/utils/PersistentFifo.o src/utils/string.o src/utils/text.o src/utils/url.o src/utils/webserver.o

Objects=$(ObjsMain) $(ObjsFetch) $(ObjsInterf) $(ObjsUtils) 

Headers=$(wildcard src/*.h)  $(wildcard src/*/*.h)

cuibin:$(ObjsMain)
	$(OFunc)

$(filter %.o,$(Objects)) :%.o:%.cc $(Headers) $(filter-out $@, $(Objects))
	$(CFunc)


.PHONY:clean
clean:
	-rm cuibin $(Objects) 
