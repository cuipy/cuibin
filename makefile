OFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@
Objects=obj/main.o
MkDir=test -d obj|| mkdir -p obj;test -d obj/utils||mkdir -p obj/utils;

cuibin:$(Objects)
	$(OFunc)
		
obj/main.o:src/main.cc src/options.h
	$(MkDir)
	$(CFunc)


clean:
	rm cuibin $(Objects)
	test -d obj&&rm -rf obj
