OFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@ 

ObjsMain=src/main.o src/global.o 
ObjsFetch=src/fetch/checker.o src/fetch/fetchOpen.o src/fetch/fetchPipe.o src/fetch/file.o src/fetch/hashTable.o  src/fetch/sequencer.o src/fetch/site.o src/fetch/specbuf.o 
ObjsInterf=src/interf/input.o src/interf/output.o src/interf/useroutput.o
ObjsUtils=src/utils/connexion.o src/utils/debug.o src/utils/hashDup.o src/utils/histogram.o src/utils/mypthread.o src/utils/PersistentFifo.o src/utils/string.o src/utils/text.o src/utils/url.o src/utils/webserver.o

Objects=$(ObjsMain) $(ObjsFetch) $(ObjsInterf) $(ObjsUtils) 

Headers=$(wildcard src/*.h)  $(wildcard src/*/*.h)

cuibin:$(ObjsMain)
	$(OFunc)

src/main.o:src/main.cc src/global.h src/utils/text.h src/fetch/checker.h src/fetch/sequencer.h src/fetch/fetchOpen.h src/fetch/fetchPipe.h src/interf/input.h src/interf/output.h src/utils/mypthread.h src/utils/debug.h src/utils/webserver.h src/utils/histogram.h
	$(CFunc)

src/global.o:src/global.cc src/global.h src/fetch/file.h src/fetch/hashTable.h src/utils/hashDup.h src/utils/url.h src/utils/Vector.h src/utils/string.h src/utils/PersistentFifo.h \
 src/utils/ConstantSizedFifo.h src/utils/SyncFifo.h src/utils/Fifo.h src/fetch/site.h src/fetch/checker.h
	$(CFunc)
	
src/utils/connexion.o:src/utils/connexion.cc src/utils/connexion.h src/options.h
	$(CFunc)
	
src/utils/debug.o:src/utils/debug.cc src/utils/debug.h src/options.h src/types.h
	$(CFunc)
	
src/utils/hashDup.o:src/utils/hashDup.cc src/utils/hashDup.h src/options.h src/types.h src/utils/connexion.h
	$(CFunc)

src/utils/histogram.o:src/utils/histogram.cc src/utils/histogram.h src/options.h src/global.h src/utils/connexion.h
	$(CFunc)	
	
src/utils/mypthread.o:src/utils/mypthread.cc src/utils/mypthread.h src/options.h
	$(CFunc)	

src/utils/PersistentFifo.o:src/utils/PersistentFifo.cc src/utils/PersistentFifo.h src/types.h src/global.h src/utils/mypthread.h src/utils/connexion.h src/utils/url.h src/utils/text.h
	$(CFunc)	
	
	

src/utils/text.o:src/utils/text.cc src/utils/text.h src/options.h src/utils/string.h
	$(CFunc)	

src/utils/url.o:src/utils/url.cc src/utils/url.h src/options.h src/types.h src/global.h src/utils/text.h src/utils/connexion.h src/utils/debug.h
	$(CFunc)	

src/utils/webserver.o:src/utils/webserver.cc src/utils/webserver.h src/options.h src/global.h src/ src/fetch/sequencer.h src/utils/text.h src/utils/connexion.h src/utils/debug.h src/utils/histogram.h src/interf/useroutput.h 
	$(CFunc)	
src/utils/string.o:src/utils/string.cc src/utils/string.h src/options.h src/types.h  src/utils/text.h src/utils/debug.h
	$(CFunc)
	
src/fetch/checker.o:src/fetch/checker.cc src/fetch/checker.h src/options.h src/types.h src/global.h src/utils/url.h src/utils/text.h src/utils/Vector.h src/utils/debug.h src/fetch/file.h src/fetch/hashTable.h
	$(CFunc)

src/fetch/defaultspecbuf.o:src/fetch/defaultspecbuf.cc
	$(CFunc)

src/fetch/dynamicspecbuf.o:src/fetch/dynamicspecbuf.cc src/fetch/dynamicspecbuf.h
	$(CFunc)

src/fetch/fetchOpen.o:src/fetch/fetchOpen.cc src/fetch/fetchOpen.h src/options.h src/global.h src/utils/Fifo.h src/utils/debug.h src/fetch/site.h 
	$(CFunc)

src/fetch/fetchPipe.o:src/fetch/fetchPipe.cc src/fetch/fetchPipe.h src/options.h src/global.h src/type.h src/utils/string.h src/utils/url.h src/utils/text.h src/utils/connexion.h src/utils/debug.h \
 src/fetch/site.h src/fetch/file.h src/interf/output.h
	$(CFunc)

src/fetch/file.o:src/fetch/file.cc src/fetch/file.h src/options.h src/global.h src/type.h src/utils/string.h src/utils/url.h src/utils/text.h src/utils/connexion.h src/utils/debug.h \
src/fetch/site.h src/fetch/file.h src/fetch/fetchOpen.h src/fetch/checker.h
	$(CFunc)

src/fetch/hashTable.o:src/fetch/hashTable.cc src/fetch/hashTable.h src/options.h src/global.h src/type.h src/utils/url.h src/utils/connexion.h  src/fetch/hashTable.h
	$(CFunc)

src/fetch/savespecbuf.o:src/fetch/savespecbuf.cc src/fetch/savespecbuf.h
	$(CFunc)	

src/fetch/sequencer.o:src/fetch/sequencer.cc src/fetch/sequencer.h src/options.h src/global.h src/type.h src/utils/url.h src/utils/debug.h src/fetch/site.h  
	$(CFunc)

src/fetch/specbuf.o:src/fetch/specbuf.cc src/fetch/specbuf.h src/fetch/defaultspecbuf.h src/fetch/dynamicspecbuf.h src/fetch/specbuf.h
	$(CFunc)	
	
src/interf/defaultuseroutput.o:src/interf/defaultuseroutput.cc  src/options.h src/global.h src/type.h src/utils/text.h src/utils/debug.h src/fetch/file.h src/interf/output.h
	$(CFunc)
	
src/interf/input.o:src/interf/input.cc  src/options.h src/global.h src/type.h src/utils/text.h src/utils/debug.h 
	$(CFunc)
	
src/interf/mirrorsaveuseroutput.o:src/interf/mirrorsaveuseroutput.cc  src/options.h src/global.h src/type.h src/utils/text.h src/utils/debug.h src/fetch/file.h src/interf/output.h
	$(CFunc)		

src/interf/output.o:src/interf/output.cc src/interf/output.h src/options.h src/global.h src/type.h src/utils/text.h src/utils/debug.h src/utils/mypthread.h src/interf/useroutput.h
	$(CFunc)	
	
src/interf/saveuseroutput.o:src/interf/saveuseroutput.cc  src/options.h src/global.h src/type.h src/utils/text.h src/utils/debug.h src/fetch/file.h src/interf/output.h
	$(CFunc)
	
src/interf/statususeroutput.o:src/interf/statususeroutput.cc  src/options.h src/global.h src/type.h src/utils/text.h src/utils/debug.h src/fetch/file.h src/interf/output.h
	$(CFunc)
		
src/interf/useroutput.o:src/interf/useroutput.cc src/interf/useroutput.h src/options.h src/interf/saveuseroutput.h src/interf/mirrorsaveuseroutput.h src/interf/statsuseroutput.h src/interf/defaultuseroutput.h
	$(CFunc)		
	
	
.PHONY:clean
clean:
	-rm cuibin $(Objects) 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
