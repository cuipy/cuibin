OFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@
Objects=obj/main.o
MkDir=test -d obj/utils||mkdir -p obj/utils;test -d obj/fetch||mkdir -p obj/fetch;test -d obj/interf||mkdir -p obj/interf;
RmDir=test -d obj&&rm -rf obj
Headers=$(windcard src/*/*.h)


cuibin:$(Objects)
	$(OFunc)
	$(warning $(Headers))

$(filter %.o,$(Objects)):obj/%.o:src/%.cc $(Headers)
	$(MkDir)
	$(CFunc)

.PHONY:clean
clean:
	-rm cuibin
	$(RmDir)
