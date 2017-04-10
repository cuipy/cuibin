OFunc=gcc -lstdc++ -o $@ $^
CFunc=gcc -c $< -o $@ 

ifeq ($(debug),true) 
all:
	cd adns;$(MAKE) debug=true;cd ..
	cd src;$(MAKE) debug=true;cd .. 	
	mv -f src/cuibin ./
else
all:
	cd adns;$(MAKE);cd ..
	cd src;$(MAKE);cd ..
	mv -f src/cuibin ./
endif

.PHONY:clean
clean:
	cd adns; $(MAKE) clean;cd ..
	cd src;$(MAKE) clean;cd ..
	rm -f cuibin 
		
	
	
