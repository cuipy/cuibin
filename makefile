OFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@
Objects=obj/main.o
<<<<<<< HEAD
MkDir=test -d obj|| mkdir -p obj;test -d obj/utils||mkdir -p obj/utils;
=======
>>>>>>> 042cffdc215f8dcfa2bb3ac7f99d0fc24ac1c186

cuibin:$(Objects)
	$(OFunc)
		
obj/main.o:src/main.cc src/options.h
<<<<<<< HEAD
	$(MkDir)
=======
	test -d obj||mkdir obj
>>>>>>> 042cffdc215f8dcfa2bb3ac7f99d0fc24ac1c186
	$(CFunc)


clean:
	rm cuibin $(Objects)
	test -d obj&&rm -rf obj
