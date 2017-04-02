OFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@
Objects=src/main.o src/global.o
Headers=$(wildcard src/*.h) $(wildcard src/*/*.h)
 

cuibin:$(Objects)
	$(OFunc)

$(filter %.o,$(Objects)):%.o:%.cc $(Headers)
	$(CFunc)

.PHONY:clean
clean:
	-rm cuibin $(Objects)
