LFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@
Objects=src/main.o src/global.o

cuibin:$(Objects)
	$(LFunc)

src/main.o:src/main.cpp src/global.h src/options.h
	$(CFunc)

src/global.o:src/global.cpp src/global.h
	$(CFunc)

clean:
	rm cuibin $(Objects)
