OFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@
Objects=obj/main.o obj/global.o

cuibin:$(Objects)
	$(OFunc)
		
obj/main.o:src/main.cc src/global.h src/options.h
	$(CFunc)

obj/global.o:src/global.cc src/global.h
	$(CFunc)

clean:
	rm cuibin $(Objects)
	@if[ -d "obj" ];
	then
		rm -rf "obj";
	fi;
