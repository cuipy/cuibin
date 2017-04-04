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

src/main.o:%.cc src/global.h src/utils/text.h src/fetch/checker.h src/fetch/sequencer.h src/fetch/fetchOpen.h src/fetch/fetchPipe.h src/interf/input.h src/interf/output.h \
src/utils/mypthread.h src/utils/debug.h src/utils/webserver.h src/utils/histogram.h
	$(CFunc)

src/global.o:%.cc src/global.h src/fetch/file.h src/fetch/hashTable.h src/utils/hashDup.h src/utils/url.h src/utils/Vector.h src/utils/string.h src/utils/PersistentFifo.h \
 src/utils/ConstantSizedFifo.h src/utils/SyncFifo.h src/utils/Fifo.h src/fetch/site.h src/fetch/checker.h
	$(CFunc)
	
src/utils/connexion.o:%.cc %.h src/options.h
	$(CFunc)
	
src/utils/debug.o:%.cc %.h src/options.h src/types.h
	$(CFunc)
	
src/utils/hashDup.o:%.cc %.h src/options.h src/types.h src/utils/connexion.h
	$(CFunc)

src/utils/histogram.o:%.cc %.h src/options.h src/global.h src/utils/connexion.h
	$(CFunc)	
	
src/utils/mypthread.o:%.cc %.h src/options.h
	$(CFunc)	

src/utils/PersistentFifo.o:%.cc %.h src/types.h src/global.h src/utils/mypthread.h src/utils/connexion.h src/utils/url.h src/utils/text.h
	$(CFunc)	
	
src/utils/string.o:%.cc %.h src/options.h src/utils/text.h src/utils/string.h src/utils/debug.h
	$(CFunc)	

src/utils/text.o:%.cc %.h src/options.h src/utils/string.h
	$(CFunc)	

src/utils/url.o:%.cc %.h src/options.h src/types.h src/global.h src/utils/text.h src/utils/connexion.h src/utils/debug.h
	$(CFunc)	

src/utils/webserver.o:%.cc %.h src/options.h src/global.h src/ src/fetch/sequencer.h src/utils/text.h src/utils/connexion.h src/utils/debug.h src/utils/histogram.h src/interf/useroutput.h 
	$(CFunc)	

src/fetch/checker.o:%.cc %.h src/options.h src/types.h src/global.h src/utils/url.h src/utils/text.h src/utils/Vector.h src/utils/debug.h src/fetch/file.h src/fetch/hashTable.h
	$(CFunc)

src/fetch/defaultspecbuf.o:%.cc
	$(CFunc)

src/fetch/dynamicspecbuf.o:%.cc %.h
	$(CFunc)

src/fetch/fetchOpen.o:%.cc %.h src/options.h src/global.h src/utils/Fifo.h src/utils/debug.h src/fetch/site.h 
	$(CFunc)

src/fetch/fetchPipe.o:%.cc %.h src/options.h src/global.h src/type.h src/utils/string.h src/utils/url.h src/utils/text.h src/utils/connexion.h src/utils/debug.h \
 src/fetch/site.h src/fetch/file.h src/interf/output.h
	$(CFunc)

src/fetch/file.o:%.cc %.h src/options.h src/global.h src/type.h src/utils/string.h src/utils/url.h src/utils/text.h src/utils/connexion.h src/utils/debug.h \
src/fetch/site.h src/fetch/file.h src/fetch/fetchOpen.h src/fetch/checker.h
	$(CFunc)

src/fetch/hashTable.o:%.cc %.h src/options.h src/global.h src/type.h src/utils/url.h src/utils/connexion.h  src/fetch/hashTable.h
	$(CFunc)

src/fetch/savespecbuf.o:%.cc %.h
	$(CFunc)	

src/fetch/sequencer.o:%.cc %.h src/options.h src/global.h src/type.h src/utils/url.h src/utils/debug.h src/fetch/site.h  
	$(CFunc)

src/fetch/specbuf.o:%.cc %.h src/fetch/defaultspecbuf.h src/fetch/dynamicspecbuf.h src/fetch/specbuf.h
	$(CFunc)	
	
src/interf/defaultuseroutput.o:%.cc  src/options.h src/global.h src/type.h src/utils/text.h src/utils/debug.h src/fetch/file.h src/interf/output.h
	$(CFunc)
	
src/interf/input.o:%.cc  src/options.h src/global.h src/type.h src/utils/text.h src/utils/debug.h 
	$(CFunc)
	
src/interf/mirrorsaveuseroutput.o:%.cc  src/options.h src/global.h src/type.h src/utils/text.h src/utils/debug.h src/fetch/file.h src/interf/output.h
	$(CFunc)		

src/interf/output.o:%.cc %.h src/options.h src/global.h src/type.h src/utils/text.h src/utils/debug.h src/utils/mypthread.h src/interf/useroutput.h
	$(CFunc)	
	
src/interf/saveuseroutput.o:%.cc  src/options.h src/global.h src/type.h src/utils/text.h src/utils/debug.h src/fetch/file.h src/interf/output.h
	$(CFunc)
	
src/interf/statususeroutput.o:%.cc  src/options.h src/global.h src/type.h src/utils/text.h src/utils/debug.h src/fetch/file.h src/interf/output.h
	$(CFunc)
		
src/interf/useroutput.o:%.cc %.h src/options.h src/interf/saveuseroutput.h src/interf/mirrorsaveuseroutput.h src/interf/statsuseroutput.h src/interf/defaultuseroutput.h
	$(CFunc)		
	
	
.PHONY:clean
clean:
	-rm cuibin $(Objects) 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
