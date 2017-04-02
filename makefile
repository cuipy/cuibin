OFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@
Objects=obj/main.o

cuibin:$(Objects)
	$(OFunc)
		
obj/main.o:src/main.cc src/options.h
	test -d obj||mkdir obj
	$(CFunc)


clean:
	rm cuibin $(Objects)
	test -d obj&&rm -rf obj
