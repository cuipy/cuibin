OFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@
Objects=obj/main.o
MkDir=test -d obj/utils||mkdir -p obj/utils;test -d obj/fetch||mkdir -p obj/fetch;test -d obj/interf||mkdir -p obj/interf;
RmDir=test -d obj&&rm -rf obj
Headers=src/global.h

cuibin:$(Objects)
	$(OFunc)
		
obj/main.o:src/main.cc $(Headers)
	$(MkDir)
	$(CFunc)


clean:
	rm cuibin
	$(RmDir)
