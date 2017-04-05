OFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@ 

all:
	cd adns;$(MAKE);cd ..
	cd src;$(MAKE);cd .. 	
	mv -f src/cuibin ./

.PHONY:clean
clean:
	cd adns; $(MAKE) clean;cd ..
	cd src;$(MAKE) clean;cd ..
	rm -f cuibin 
		
	
	
